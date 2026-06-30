import 'dart:isolate';
import 'dart:ui';

import 'package:flutter/gestures.dart';
import 'package:flutter/widgets.dart' hide Image;
import 'package:flutter_rfb/src/remote_frame_buffer_isolate_messages.dart';
import 'package:fpdart/fpdart.dart';

class RemoteFrameBufferGestureDetector extends StatelessWidget {
  final Widget _child;
  final Image _image;
  final Size _remoteFrameBufferWidgetSize;
  final Option<SendPort> _sendPort;

  const RemoteFrameBufferGestureDetector({
    super.key,
    required final Image image,
    required final Size remoteFrameBufferWidgetSize,
    required final Option<SendPort> sendPort,
    required final Widget child,
  })  : _child = child,
        _image = image,
        _remoteFrameBufferWidgetSize = remoteFrameBufferWidgetSize,
        _sendPort = sendPort;

  @override
  Widget build(final BuildContext context) => Listener(
        behavior: HitTestBehavior.opaque,
        onPointerCancel: _sendPointerUpEvent,
        onPointerDown: _sendPointerEvent,
        onPointerHover: _sendPointerEvent,
        onPointerMove: _sendPointerEvent,
        onPointerUp: _sendPointerEvent,
        child: _child,
      );

  bool _buttonIsDown({required final int buttons, required final int button}) =>
      (buttons & button) != 0;

  int _scaleCoordinate({
    required final double localCoordinate,
    required final double localExtent,
    required final int remoteExtent,
  }) {
    if (localExtent <= 0 || remoteExtent <= 0) {
      return 0;
    }

    return (localCoordinate / localExtent * remoteExtent)
        .floor()
        .clamp(0, remoteExtent - 1);
  }

  void _sendPointerEvent(final PointerEvent event) => _sendPort.match(
        () {},
        (final SendPort sendPort) => sendPort.send(
          RemoteFrameBufferIsolateSendMessage.pointerEvent(
            button1Down: _buttonIsDown(
              buttons: event.buttons,
              button: kPrimaryMouseButton,
            ),
            button2Down: _buttonIsDown(
              buttons: event.buttons,
              button: kMiddleMouseButton,
            ),
            button3Down: _buttonIsDown(
              buttons: event.buttons,
              button: kSecondaryMouseButton,
            ),
            button4Down: _buttonIsDown(
              buttons: event.buttons,
              button: kBackMouseButton,
            ),
            button5Down: _buttonIsDown(
              buttons: event.buttons,
              button: kForwardMouseButton,
            ),
            button6Down: false,
            button7Down: false,
            button8Down: false,
            x: _scaleCoordinate(
              localCoordinate: event.localPosition.dx,
              localExtent: _remoteFrameBufferWidgetSize.width,
              remoteExtent: _image.width,
            ),
            y: _scaleCoordinate(
              localCoordinate: event.localPosition.dy,
              localExtent: _remoteFrameBufferWidgetSize.height,
              remoteExtent: _image.height,
            ),
          ),
        ),
      );

  void _sendPointerUpEvent(final PointerEvent event) => _sendPort.match(
        () {},
        (final SendPort sendPort) => sendPort.send(
          RemoteFrameBufferIsolateSendMessage.pointerEvent(
            button1Down: false,
            button2Down: false,
            button3Down: false,
            button4Down: false,
            button5Down: false,
            button6Down: false,
            button7Down: false,
            button8Down: false,
            x: _scaleCoordinate(
              localCoordinate: event.localPosition.dx,
              localExtent: _remoteFrameBufferWidgetSize.width,
              remoteExtent: _image.width,
            ),
            y: _scaleCoordinate(
              localCoordinate: event.localPosition.dy,
              localExtent: _remoteFrameBufferWidgetSize.height,
              remoteExtent: _image.height,
            ),
          ),
        ),
      );
}
