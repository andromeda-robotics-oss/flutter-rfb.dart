import 'dart:isolate';
import 'dart:typed_data';

import 'package:dart_rfb/dart_rfb.dart';
import 'package:flutter_rfb/src/remote_frame_buffer_isolate_messages.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('framebuffer updates transfer only rectangle payload bytes', () async {
    final ReceivePort messagePort = ReceivePort();
    final ReceivePort clientPort = ReceivePort();
    addTearDown(messagePort.close);
    addTearDown(clientPort.close);
    final Uint8List sourceBytes = Uint8List.fromList(<int>[9, 1, 2, 3, 4, 8]);
    final RemoteFrameBufferIsolateFrameBufferUpdate message =
        RemoteFrameBufferIsolateFrameBufferUpdate.fromClientUpdate(
      frameBufferHeight: 1,
      frameBufferWidth: 1,
      sendPort: clientPort.sendPort,
      update: RemoteFrameBufferClientUpdate(
        rectangles: <RemoteFrameBufferClientUpdateRectangle>[
          RemoteFrameBufferClientUpdateRectangle(
            byteData: ByteData.sublistView(sourceBytes, 1, 5),
            encodingType: const RemoteFrameBufferEncodingType.raw(),
            height: 1,
            width: 1,
            x: 0,
            y: 0,
          ),
        ],
      ),
    );
    messagePort.sendPort.send(message);

    final RemoteFrameBufferIsolateFrameBufferUpdate transferredMessage =
        await messagePort.first as RemoteFrameBufferIsolateFrameBufferUpdate;

    final List<RemoteFrameBufferClientUpdateRectangle> rectangles =
        transferredMessage.materializeRectangles().toList(growable: false);

    expect(transferredMessage.frameBufferHeight, 1);
    expect(transferredMessage.frameBufferWidth, 1);
    expect(transferredMessage.rectangles, hasLength(1));
    expect(rectangles, hasLength(1));
    expect(rectangles.single.byteData.buffer.asUint8List(), <int>[1, 2, 3, 4]);
    expect(
      rectangles.single.encodingType,
      const RemoteFrameBufferEncodingType.raw(),
    );
  });
}
