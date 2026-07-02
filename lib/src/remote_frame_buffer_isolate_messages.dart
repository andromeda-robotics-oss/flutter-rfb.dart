import 'dart:isolate';

import 'package:dart_rfb/dart_rfb.dart';
import 'package:flutter/foundation.dart';
import 'package:fpdart/fpdart.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'remote_frame_buffer_isolate_messages.freezed.dart';

const int _transferablePayloadByteThreshold = 64 * 1024;

/// The initialization message sent when creating the isolate.
@freezed
class RemoteFrameBufferIsolateInitMessage
    with _$RemoteFrameBufferIsolateInitMessage {
  const factory RemoteFrameBufferIsolateInitMessage({
    required final String hostName,
    required final Option<String> password,
    required final int port,
    required final Option<String> unixSocketPath,

    /// The [SendPort] used for communicating with the caller.
    required final SendPort sendPort,
  }) = _RemoteFrameBufferIsolateInitMessage;
}

/// A message that providers a received client update to the caller.
@freezed
class RemoteFrameBufferIsolateReceiveMessage
    with _$RemoteFrameBufferIsolateReceiveMessage {
  const factory RemoteFrameBufferIsolateReceiveMessage.clipBoardUpdate({
    required final String text,
  }) = RemoteFrameBufferIsolateReceiveMessageClipBoardUpdate;
}

/// A framebuffer update sent from the client isolate.
///
/// Large pixel payloads are moved with [TransferableTypedData], while smaller
/// payloads are sent inline to avoid transferable-object overhead.
class RemoteFrameBufferIsolateFrameBufferUpdate {
  /// The framebuffer height in pixels.
  final int frameBufferHeight;

  /// The framebuffer width in pixels.
  final int frameBufferWidth;

  /// The rectangles included in this update.
  final List<RemoteFrameBufferIsolateFrameBufferUpdateRectangle> rectangles;

  /// The [SendPort] used to communicate back to the client isolate.
  final SendPort sendPort;

  /// Creates a transferable framebuffer update message.
  const RemoteFrameBufferIsolateFrameBufferUpdate({
    required this.frameBufferHeight,
    required this.frameBufferWidth,
    required this.rectangles,
    required this.sendPort,
  });

  /// Converts a client update into an isolate-transferable message.
  factory RemoteFrameBufferIsolateFrameBufferUpdate.fromClientUpdate({
    required final int frameBufferHeight,
    required final int frameBufferWidth,
    required final SendPort sendPort,
    required final RemoteFrameBufferClientUpdate update,
  }) =>
      RemoteFrameBufferIsolateFrameBufferUpdate(
        frameBufferHeight: frameBufferHeight,
        frameBufferWidth: frameBufferWidth,
        rectangles: update.rectangles
            .map(
              RemoteFrameBufferIsolateFrameBufferUpdateRectangle
                  .fromClientRectangle,
            )
            .toList(growable: false),
        sendPort: sendPort,
      );

  /// Materializes rectangle payloads into client update rectangles.
  Iterable<RemoteFrameBufferClientUpdateRectangle>
      materializeRectangles() sync* {
    for (final RemoteFrameBufferIsolateFrameBufferUpdateRectangle rectangle
        in rectangles) {
      yield rectangle.materialize();
    }
  }
}

/// A framebuffer update rectangle with a transferable byte payload.
class RemoteFrameBufferIsolateFrameBufferUpdateRectangle {
  /// The rectangle pixel or copy-rect payload.
  final _FrameBufferUpdatePayload _byteData;

  /// The encoding used to interpret the payload bytes.
  final RemoteFrameBufferEncodingType encodingType;

  /// The height in pixels.
  final int height;

  /// The width in pixels.
  final int width;

  /// The starting x offset of this rectangle.
  final int x;

  /// The starting y offset of this rectangle.
  final int y;

  const RemoteFrameBufferIsolateFrameBufferUpdateRectangle._({
    required final _FrameBufferUpdatePayload byteData,
    required this.encodingType,
    required this.height,
    required this.width,
    required this.x,
    required this.y,
  }) : _byteData = byteData;

  /// Converts a client rectangle into a transferable rectangle.
  factory RemoteFrameBufferIsolateFrameBufferUpdateRectangle.fromClientRectangle(
    final RemoteFrameBufferClientUpdateRectangle rectangle,
  ) =>
      RemoteFrameBufferIsolateFrameBufferUpdateRectangle._(
        byteData: _FrameBufferUpdatePayload.fromByteData(
          rectangle.byteData,
        ),
        encodingType: rectangle.encodingType,
        height: rectangle.height,
        width: rectangle.width,
        x: rectangle.x,
        y: rectangle.y,
      );

  /// Materializes the payload bytes into a client update rectangle.
  RemoteFrameBufferClientUpdateRectangle materialize() =>
      RemoteFrameBufferClientUpdateRectangle(
        byteData: _byteData.materialize(),
        encodingType: encodingType,
        height: height,
        width: width,
        x: x,
        y: y,
      );
}

sealed class _FrameBufferUpdatePayload {
  const _FrameBufferUpdatePayload();

  factory _FrameBufferUpdatePayload.fromByteData(final ByteData byteData) {
    final Uint8List bytes = byteData.buffer.asUint8List(
      byteData.offsetInBytes,
      byteData.lengthInBytes,
    );
    if (bytes.lengthInBytes >= _transferablePayloadByteThreshold) {
      return _TransferableFrameBufferUpdatePayload(
        TransferableTypedData.fromList(<Uint8List>[bytes]),
      );
    }
    return _InlineFrameBufferUpdatePayload(
      _coversWholeBuffer(byteData) ? bytes : Uint8List.fromList(bytes),
    );
  }

  ByteData materialize();

  static bool _coversWholeBuffer(final ByteData byteData) =>
      byteData.offsetInBytes == 0 &&
      byteData.lengthInBytes == byteData.buffer.lengthInBytes;
}

class _InlineFrameBufferUpdatePayload extends _FrameBufferUpdatePayload {
  final Uint8List bytes;

  const _InlineFrameBufferUpdatePayload(this.bytes);

  @override
  ByteData materialize() => ByteData.sublistView(bytes);
}

class _TransferableFrameBufferUpdatePayload extends _FrameBufferUpdatePayload {
  final TransferableTypedData bytes;

  const _TransferableFrameBufferUpdatePayload(this.bytes);

  @override
  ByteData materialize() => bytes.materialize().asByteData();
}

/// A message that is sent to the isolate.
@freezed
class RemoteFrameBufferIsolateSendMessage
    with _$RemoteFrameBufferIsolateSendMessage {
  /// A message that is sent when the client's clipboard is updated.
  const factory RemoteFrameBufferIsolateSendMessage.clipBoardUpdate({
    required final String text,
  }) = RemoteFrameBufferIsolateSendMessageClipBoardUpdate;

  /// A message that is sent when a key is pressed.
  const factory RemoteFrameBufferIsolateSendMessage.keyEvent({
    required final bool down,
    required final int key,
  }) = RemoteFrameBufferIsolateSendMessageKeyEvent;

  /// A message that represents the state of all pointer buttons and coordinates.
  const factory RemoteFrameBufferIsolateSendMessage.pointerEvent({
    required final bool button1Down,
    required final bool button2Down,
    required final bool button3Down,
    required final bool button4Down,
    required final bool button5Down,
    required final bool button6Down,
    required final bool button7Down,
    required final bool button8Down,
    required final int x,
    required final int y,
  }) = RemoteFrameBufferIsolateSendMessagePointerEvent;

  /// A message that indicates that the client wants to issue a new update
  /// request.
  const factory RemoteFrameBufferIsolateSendMessage.frameBufferUpdateRequest() =
      RemoteFrameBufferIsolateSendMessageUpdateRequest;
}
