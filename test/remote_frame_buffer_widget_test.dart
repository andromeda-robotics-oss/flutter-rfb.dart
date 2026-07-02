import 'dart:ui';

import 'package:dart_rfb/dart_rfb.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_rfb/src/remote_frame_buffer_widget.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'remote_frame_buffer_widget_test.freezed.dart';

@freezed
class UpdateFrameBufferVariant with _$UpdateFrameBufferVariant {
  const factory UpdateFrameBufferVariant({
    required final ByteData expectedFrameBuffer,
    required final ByteData inputFrameBuffer,
    required final Size inputFrameBufferSize,
    required final RemoteFrameBufferClientUpdateRectangle inputRectangle,
  }) = _UpdateFrameBufferVariant;
}

void main() {
  final ValueVariant<UpdateFrameBufferVariant> updateFrameBufferVariant =
      ValueVariant<UpdateFrameBufferVariant>(<UpdateFrameBufferVariant>{
    UpdateFrameBufferVariant(
      expectedFrameBuffer:
          Uint8List.fromList(<int>[1, 1, 1, 255]).buffer.asByteData(),
      inputFrameBuffer:
          Uint8List.fromList(<int>[0, 0, 0, 0]).buffer.asByteData(),
      inputFrameBufferSize: const Size(1, 1),
      inputRectangle: RemoteFrameBufferClientUpdateRectangle(
        byteData: Uint8List.fromList(<int>[1, 1, 1, 0]).buffer.asByteData(),
        encodingType: const RemoteFrameBufferEncodingType.raw(),
        height: 1,
        width: 1,
        x: 0,
        y: 0,
      ),
    ),
    UpdateFrameBufferVariant(
      expectedFrameBuffer: Uint8List.fromList(<int>[
        1,
        1,
        1,
        255,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
      ]).buffer.asByteData(),
      inputFrameBuffer: Uint8List.fromList(<int>[
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
      ]).buffer.asByteData(),
      inputFrameBufferSize: const Size(2, 2),
      inputRectangle: RemoteFrameBufferClientUpdateRectangle(
        byteData: Uint8List.fromList(<int>[1, 1, 1, 0]).buffer.asByteData(),
        encodingType: const RemoteFrameBufferEncodingType.raw(),
        height: 1,
        width: 1,
        x: 0,
        y: 0,
      ),
    ),
    UpdateFrameBufferVariant(
      expectedFrameBuffer: Uint8List.fromList(<int>[
        0,
        0,
        0,
        0,
        1,
        1,
        1,
        255,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
      ]).buffer.asByteData(),
      inputFrameBuffer: Uint8List.fromList(<int>[
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
      ]).buffer.asByteData(),
      inputFrameBufferSize: const Size(2, 2),
      inputRectangle: RemoteFrameBufferClientUpdateRectangle(
        byteData: Uint8List.fromList(<int>[1, 1, 1, 0]).buffer.asByteData(),
        encodingType: const RemoteFrameBufferEncodingType.raw(),
        height: 1,
        width: 1,
        x: 1,
        y: 0,
      ),
    ),
    UpdateFrameBufferVariant(
      expectedFrameBuffer: Uint8List.fromList(<int>[
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        1,
        1,
        1,
        255,
        0,
        0,
        0,
        0,
      ]).buffer.asByteData(),
      inputFrameBuffer: Uint8List.fromList(<int>[
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
      ]).buffer.asByteData(),
      inputFrameBufferSize: const Size(2, 2),
      inputRectangle: RemoteFrameBufferClientUpdateRectangle(
        byteData: Uint8List.fromList(<int>[1, 1, 1, 0]).buffer.asByteData(),
        encodingType: const RemoteFrameBufferEncodingType.raw(),
        height: 1,
        width: 1,
        x: 0,
        y: 1,
      ),
    ),
    UpdateFrameBufferVariant(
      expectedFrameBuffer: Uint8List.fromList(<int>[
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        1,
        1,
        1,
        255,
      ]).buffer.asByteData(),
      inputFrameBuffer: Uint8List.fromList(<int>[
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
      ]).buffer.asByteData(),
      inputFrameBufferSize: const Size(2, 2),
      inputRectangle: RemoteFrameBufferClientUpdateRectangle(
        byteData: Uint8List.fromList(<int>[1, 1, 1, 0]).buffer.asByteData(),
        encodingType: const RemoteFrameBufferEncodingType.raw(),
        height: 1,
        width: 1,
        x: 1,
        y: 1,
      ),
    ),
  });

  testWidgets(
    'updateFrameBuffer(...) works',
    variant: updateFrameBufferVariant,
    (final _) async {
      await RemoteFrameBufferWidgetState.updateFrameBuffer(
        frameBuffer: updateFrameBufferVariant.currentValue!.inputFrameBuffer,
        frameBufferSize:
            updateFrameBufferVariant.currentValue!.inputFrameBufferSize,
        rectangle: updateFrameBufferVariant.currentValue!.inputRectangle,
      ).run();
      expect(
        updateFrameBufferVariant.currentValue!.inputFrameBuffer.buffer
            .asUint8List(),
        updateFrameBufferVariant.currentValue!.expectedFrameBuffer.buffer
            .asUint8List(),
      );
    },
  );

  testWidgets('updateFrameBuffer(...) handles overlapping copyRect updates', (
    final _,
  ) async {
    final ByteData frameBuffer = Uint8List.fromList(<int>[
      ..._pixel(1),
      ..._pixel(2),
      ..._pixel(3),
      ..._pixel(4),
      ..._pixel(0),
      ..._pixel(0),
    ]).buffer.asByteData();

    await RemoteFrameBufferWidgetState.updateFrameBuffer(
      frameBuffer: frameBuffer,
      frameBufferSize: const Size(2, 3),
      rectangle: RemoteFrameBufferClientUpdateRectangle(
        byteData: _copyRectSourceBytes(x: 0, y: 0),
        encodingType: const RemoteFrameBufferEncodingType.copyRect(),
        height: 2,
        width: 2,
        x: 0,
        y: 1,
      ),
    ).run();

    expect(
      frameBuffer.buffer.asUint8List(),
      Uint8List.fromList(<int>[
        ..._pixel(1),
        ..._pixel(2),
        ..._pixel(1),
        ..._pixel(2),
        ..._pixel(3),
        ..._pixel(4),
      ]),
    );
  });
}

ByteData _copyRectSourceBytes({
  required final int x,
  required final int y,
}) =>
    ByteData(4)
      ..setUint16(0, x)
      ..setUint16(2, y);

List<int> _pixel(final int value) => <int>[value, value, value, 0xff];
