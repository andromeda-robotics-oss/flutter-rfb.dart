import 'dart:async';
import 'dart:isolate';
import 'dart:ui';

import 'package:dart_rfb/dart_rfb.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart' hide Image;
import 'package:flutter/services.dart';
import 'package:flutter_rfb/src/child_size_notifier_widget.dart';
import 'package:flutter_rfb/src/extensions/logical_keyboard_key_extensions.dart';
import 'package:flutter_rfb/src/remote_frame_buffer_client_isolate.dart';
import 'package:flutter_rfb/src/remote_frame_buffer_gesture_detector.dart';
import 'package:flutter_rfb/src/remote_frame_buffer_isolate_messages.dart';
import 'package:fpdart/fpdart.dart' hide State;
import 'package:logging/logging.dart';

final Logger _logger = Logger('RemoteFrameBufferWidget');

/// This widget displays the framebuffer associated with the RFB session.
/// On creation, it tries to establish a connection with the remote server
/// in an isolate. On success, it runs the read loop in that isolate.
class RemoteFrameBufferWidget extends StatefulWidget {
  final Option<Widget> _connectingWidget;
  final String _hostName;
  final Option<void Function(Object error)> _onError;
  final Option<String> _password;
  final int _port;
  final Option<String> _unixSocketPath;

  /// Immediately tries to establish a connection to a remote server at
  /// [hostName]:[port] or [unixSocketPath], optionally using [password].
  RemoteFrameBufferWidget({
    super.key,
    final Widget? connectingWidget,
    final String? hostName,
    final void Function(Object error)? onError,
    final String? password,
    final int port = 5900,
    final String? unixSocketPath,
  })  : _connectingWidget = optionOf(connectingWidget),
        _hostName = _endpointHostName(
          hostName: hostName,
          unixSocketPath: unixSocketPath,
        ),
        _onError = optionOf(onError),
        _password = optionOf(password),
        _port = port,
        _unixSocketPath = _endpointUnixSocketPath(unixSocketPath);

  static String _endpointHostName({
    required final String? hostName,
    required final String? unixSocketPath,
  }) {
    final bool hasHostName = hostName?.isNotEmpty ?? false;
    final bool hasUnixSocketPath = unixSocketPath?.isNotEmpty ?? false;
    if (hasHostName == hasUnixSocketPath) {
      throw ArgumentError(
        'Provide exactly one of hostName or unixSocketPath.',
      );
    }
    return hostName ?? '';
  }

  static Option<String> _endpointUnixSocketPath(
    final String? unixSocketPath,
  ) =>
      unixSocketPath == null || unixSocketPath.isEmpty
          ? none()
          : some(unixSocketPath);

  @override
  State<RemoteFrameBufferWidget> createState() =>
      RemoteFrameBufferWidgetState();
}

@visibleForTesting
class RemoteFrameBufferWidgetState extends State<RemoteFrameBufferWidget> {
  late Timer _clipBoardMonitorTimer;
  Option<ByteData> _frameBuffer = none();
  Option<Image> _image = none();
  Option<Isolate> _isolate = none();
  Option<SendPort> _isolateSendPort = none();
  final ValueNotifier<Size> _sizeValueNotifier = ValueNotifier<Size>(Size.zero);
  Option<StreamSubscription<Object?>> _streamSubscription = none();

  @override
  Widget build(final BuildContext context) => _image.match(
        _buildConnecting,
        (final Image image) => _buildImage(image: image),
      );

  @override
  void dispose() {
    _clipBoardMonitorTimer.cancel();
    _streamSubscription.match(
      () {},
      (final StreamSubscription<Object?> subscription) =>
          unawaited(subscription.cancel()),
    );
    _image.match(
      () {},
      (final Image image) => image.dispose(),
    );
    _isolate.match(
      () {},
      (final Isolate isolate) => isolate.kill(),
    );
    HardwareKeyboard.instance.removeHandler(_keyEventListener);
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _monitorClipBoard();
    HardwareKeyboard.instance.addHandler(_keyEventListener);
    unawaited(_initAsync());
  }

  Widget _buildConnecting() => widget._connectingWidget.getOrElse(
        () => const Center(
          child: CircularProgressIndicator(),
        ),
      );

  SizeTrackingWidget _buildImage({required final Image image}) =>
      SizeTrackingWidget(
        sizeValueNotifier: _sizeValueNotifier,
        child: ValueListenableBuilder<Size>(
          valueListenable: _sizeValueNotifier,
          child: RepaintBoundary(
            child: RawImage(
              image: image,
            ),
          ),
          builder: (
            final BuildContext context,
            final Size remoteFrameBufferWidgetSize,
            final Widget? child,
          ) =>
              RemoteFrameBufferGestureDetector(
            image: image,
            remoteFrameBufferWidgetSize: remoteFrameBufferWidgetSize,
            sendPort: _isolateSendPort,
            child: child!,
          ),
        ),
      );

  Future<void> _decodeAndUpdateImage({
    required final ByteData frameBuffer,
    required final RemoteFrameBufferIsolateReceiveMessageFrameBufferUpdate
        message,
  }) async {
    final Image result = await _decodeFrameBufferImage(
      frameBufferHeight: message.frameBufferHeight,
      frameBufferWidth: message.frameBufferWidth,
      pixels: _asUint8List(frameBuffer),
    );
    if (!mounted) {
      result.dispose();
      return;
    }

    setState(
      () {
        _image.match(
          () {},
          (final Image image) => image.dispose(),
        );
        _image = some(result);
      },
    );
    _requestFrameBufferUpdate();
  }

  static Future<Image> _decodeFrameBufferImage({
    required final int frameBufferHeight,
    required final int frameBufferWidth,
    required final Uint8List pixels,
  }) async {
    final ImmutableBuffer buffer = await ImmutableBuffer.fromUint8List(pixels);
    final ImageDescriptor descriptor = ImageDescriptor.raw(
      buffer,
      height: frameBufferHeight,
      pixelFormat: PixelFormat.bgra8888,
      width: frameBufferWidth,
    );
    try {
      final Codec codec = await descriptor.instantiateCodec();
      try {
        final FrameInfo frameInfo = await codec.getNextFrame();
        return frameInfo.image;
      } finally {
        codec.dispose();
      }
    } finally {
      descriptor.dispose();
      buffer.dispose();
    }
  }

  Future<void> _handleFrameBufferUpdateMessage({
    required final RemoteFrameBufferIsolateReceiveMessageFrameBufferUpdate
        update,
  }) async {
    _logger.finer(
      'Received new update message with '
      '${update.update.rectangles.length} rectangles',
    );
    _isolateSendPort = some(update.sendPort);
    if (_frameBuffer.isNone()) {
      _frameBuffer = some(
        ByteData(
          update.frameBufferHeight * update.frameBufferWidth * 4,
        ),
      );
    }

    final ByteData frameBuffer = _frameBuffer.getOrElse(
      () => throw StateError('Frame buffer is not available'),
    );
    try {
      for (final RemoteFrameBufferClientUpdateRectangle rectangle
          in update.update.rectangles) {
        _applyUpdateRectangle(
          frameBuffer: frameBuffer,
          frameBufferSize: Size(
            update.frameBufferWidth.toDouble(),
            update.frameBufferHeight.toDouble(),
          ),
          rectangle: rectangle,
        );
      }
      await _decodeAndUpdateImage(
        frameBuffer: frameBuffer,
        message: update,
      );
    } on Object catch (error, stackTrace) {
      _logger.warning('Error updating frame buffer', error, stackTrace);
    }
  }

  void _requestFrameBufferUpdate() {
    _isolateSendPort.match(
      () {},
      (final SendPort sendPort) => sendPort.send(
        const RemoteFrameBufferIsolateSendMessage.frameBufferUpdateRequest(),
      ),
    );
  }

  /// Initializes logic that requires to be run asynchronous.
  Future<void> _initAsync() async {
    final ReceivePort receivePort = ReceivePort();
    _streamSubscription = some(
      receivePort.listen(
        (final Object? message) {
          // Error, first is error, second is stacktrace or null
          if (message is List) {
            widget._onError.match(
              () {},
              (final void Function(Object error) onError) =>
                  onError(message.first),
            );
          } else if (message is RemoteFrameBufferIsolateReceiveMessage) {
            message.map(
              clipBoardUpdate: (
                final RemoteFrameBufferIsolateReceiveMessageClipBoardUpdate
                    update,
              ) {
                unawaited(
                  Clipboard.setData(ClipboardData(text: update.text)),
                );
              },
              frameBufferUpdate: (
                final RemoteFrameBufferIsolateReceiveMessageFrameBufferUpdate
                    update,
              ) {
                unawaited(_handleFrameBufferUpdateMessage(update: update));
              },
            );
          }
        },
      ),
    );
    _logger.info('Spawning new isolate for RFB client');
    _isolate = some(
      await Isolate.spawn(
        startRemoteFrameBufferClient,
        RemoteFrameBufferIsolateInitMessage(
          hostName: widget._hostName,
          password: widget._password,
          port: widget._port,
          sendPort: receivePort.sendPort,
          unixSocketPath: widget._unixSocketPath,
        ),
        onError: receivePort.sendPort,
      ),
    );
  }

  void _monitorClipBoard() {
    Option<String> lastClipBoardContent = none();
    _clipBoardMonitorTimer = Timer.periodic(
      const Duration(seconds: 1),
      (final _) async {
        optionOf(await Clipboard.getData(Clipboard.kTextPlain))
            .flatMap((final ClipboardData data) => optionOf(data.text))
            .filter(
              (final String text) => lastClipBoardContent.match(
                () => true,
                (final String lastClipBoardContent) =>
                    lastClipBoardContent != text,
              ),
            )
            .match(
              () {},
              (final String text) => _isolateSendPort.match(
                () {},
                (final SendPort sendPort) {
                  lastClipBoardContent = some(text);
                  sendPort.send(
                    RemoteFrameBufferIsolateSendMessage.clipBoardUpdate(
                      text: text,
                    ),
                  );
                },
              ),
            );
      },
    );
  }

  bool _keyEventListener(final KeyEvent keyEvent) {
    _isolateSendPort.match(
      () {},
      (final SendPort sendPort) => sendPort.send(
        RemoteFrameBufferIsolateSendMessage.keyEvent(
          down: keyEvent is KeyDownEvent || keyEvent is KeyRepeatEvent,
          key: keyEvent.logicalKey.asXWindowSystemKey(),
        ),
      ),
    );
    return false;
  }

  /// Updates [frameBuffer] with the given [rectangle]s.
  @visibleForTesting
  static TaskEither<Object, void> updateFrameBuffer({
    required final ByteData frameBuffer,
    required final Size frameBufferSize,
    required final RemoteFrameBufferClientUpdateRectangle rectangle,
  }) =>
      TaskEither<Object, void>.tryCatch(
        () async {
          _applyUpdateRectangle(
            frameBuffer: frameBuffer,
            frameBufferSize: frameBufferSize,
            rectangle: rectangle,
          );
        },
        (final Object error, final _) => error,
      );

  static void _applyUpdateRectangle({
    required final ByteData frameBuffer,
    required final Size frameBufferSize,
    required final RemoteFrameBufferClientUpdateRectangle rectangle,
  }) {
    rectangle.encodingType.when(
      copyRect: () {
        _copyFrameBufferRectangle(
          destinationX: rectangle.x,
          destinationY: rectangle.y,
          frameBuffer: frameBuffer,
          frameBufferSize: frameBufferSize,
          height: rectangle.height,
          sourceX: rectangle.byteData.getUint16(0),
          sourceY: rectangle.byteData.getUint16(2),
          width: rectangle.width,
        );
      },
      raw: () {
        _writeRawRectangle(
          frameBuffer: frameBuffer,
          frameBufferSize: frameBufferSize,
          rectangle: rectangle,
        );
      },
      unsupported: (final ByteData bytes) {},
    );
  }

  static Uint8List _asUint8List(final ByteData byteData) =>
      byteData.buffer.asUint8List(
        byteData.offsetInBytes,
        byteData.lengthInBytes,
      );

  static void _copyFrameBufferRectangle({
    required final int destinationX,
    required final int destinationY,
    required final ByteData frameBuffer,
    required final Size frameBufferSize,
    required final int height,
    required final int sourceX,
    required final int sourceY,
    required final int width,
  }) {
    final Uint8List frameBufferBytes = _asUint8List(frameBuffer);
    final int frameBufferWidth = frameBufferSize.width.toInt();
    final int rowByteLength = width * 4;
    final int startRow = destinationY > sourceY ? height - 1 : 0;
    final int endRow = destinationY > sourceY ? -1 : height;
    final int step = destinationY > sourceY ? -1 : 1;
    for (int row = startRow; row != endRow; row += step) {
      final int sourceStart =
          ((sourceY + row) * frameBufferWidth + sourceX) * 4;
      final int destinationStart =
          ((destinationY + row) * frameBufferWidth + destinationX) * 4;
      frameBufferBytes.setRange(
        destinationStart,
        destinationStart + rowByteLength,
        frameBufferBytes,
        sourceStart,
      );
      _forceOpaqueAlpha(
        bytes: frameBufferBytes,
        start: destinationStart,
        length: rowByteLength,
      );
    }
  }

  static void _writeRawRectangle({
    required final ByteData frameBuffer,
    required final Size frameBufferSize,
    required final RemoteFrameBufferClientUpdateRectangle rectangle,
  }) {
    final Uint8List frameBufferBytes = _asUint8List(frameBuffer);
    final Uint8List rectangleBytes = _asUint8List(rectangle.byteData);
    final int frameBufferWidth = frameBufferSize.width.toInt();
    final int rowByteLength = rectangle.width * 4;
    for (int row = 0; row < rectangle.height; row++) {
      final int sourceStart = row * rowByteLength;
      final int destinationStart =
          ((rectangle.y + row) * frameBufferWidth + rectangle.x) * 4;
      frameBufferBytes.setRange(
        destinationStart,
        destinationStart + rowByteLength,
        rectangleBytes,
        sourceStart,
      );
      _forceOpaqueAlpha(
        bytes: frameBufferBytes,
        start: destinationStart,
        length: rowByteLength,
      );
    }
  }

  static void _forceOpaqueAlpha({
    required final Uint8List bytes,
    required final int length,
    required final int start,
  }) {
    final int end = start + length;
    for (int offset = start + 3; offset < end; offset += 4) {
      bytes[offset] = 0xff;
    }
  }
}
