import 'dart:isolate';

import 'package:dart_rfb/dart_rfb.dart';
import 'package:flutter/foundation.dart';
import 'package:fpdart/fpdart.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'remote_frame_buffer_isolate_messages.freezed.dart';

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

/// A framebuffer update sent from the client isolate using transferable bytes.
///
/// Only rectangle metadata is copied through the isolate message. Pixel payloads
/// are moved with [TransferableTypedData] and must be materialized exactly once
/// by the receiving isolate.
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
  /// The transferable rectangle pixel or copy-rect payload.
  final TransferableTypedData byteData;

  /// The encoding used to interpret [byteData].
  final RemoteFrameBufferEncodingType encodingType;

  /// The height in pixels.
  final int height;

  /// The width in pixels.
  final int width;

  /// The starting x offset of this rectangle.
  final int x;

  /// The starting y offset of this rectangle.
  final int y;

  /// Creates a transferable framebuffer update rectangle.
  const RemoteFrameBufferIsolateFrameBufferUpdateRectangle({
    required this.byteData,
    required this.encodingType,
    required this.height,
    required this.width,
    required this.x,
    required this.y,
  });

  /// Converts a client rectangle into a transferable rectangle.
  factory RemoteFrameBufferIsolateFrameBufferUpdateRectangle.fromClientRectangle(
    final RemoteFrameBufferClientUpdateRectangle rectangle,
  ) =>
      RemoteFrameBufferIsolateFrameBufferUpdateRectangle(
        byteData: TransferableTypedData.fromList(
          <Uint8List>[
            rectangle.byteData.buffer.asUint8List(
              rectangle.byteData.offsetInBytes,
              rectangle.byteData.lengthInBytes,
            ),
          ],
        ),
        encodingType: rectangle.encodingType,
        height: rectangle.height,
        width: rectangle.width,
        x: rectangle.x,
        y: rectangle.y,
      );

  /// Materializes [byteData] into a client update rectangle.
  RemoteFrameBufferClientUpdateRectangle materialize() =>
      RemoteFrameBufferClientUpdateRectangle(
        byteData: byteData.materialize().asByteData(),
        encodingType: encodingType,
        height: height,
        width: width,
        x: x,
        y: y,
      );
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
