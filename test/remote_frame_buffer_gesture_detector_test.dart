import 'dart:async';
import 'dart:isolate';
import 'dart:ui' as ui;

import 'package:flutter/gestures.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_rfb/src/remote_frame_buffer_gesture_detector.dart';
import 'package:flutter_rfb/src/remote_frame_buffer_isolate_messages.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';

const Size widgetSize = Size(100, 50);

void main() {
  late ui.Image image;
  late ReceivePort receivePort;
  late StreamIterator<dynamic> messages;

  setUp(() async {
    image = await createTestImage(width: 200, height: 100, cache: false);
    receivePort = ReceivePort();
    messages = StreamIterator<dynamic>(receivePort);
  });

  tearDown(() async {
    await messages.cancel();
    receivePort.close();
    image.dispose();
  });

  testWidgets('sends pointer events on hover', (
    final WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      _buildDetector(image: image, receivePort: receivePort),
    );

    final TestGesture gesture = await tester.createGesture(
      kind: ui.PointerDeviceKind.mouse,
    );
    await gesture.addPointer(location: Offset.zero);
    await gesture.moveTo(const Offset(25, 10));

    final RemoteFrameBufferIsolateSendMessagePointerEvent pointerEvent =
        await _nextPointerEvent(
      tester: tester,
      messages: messages,
    );
    expect(pointerEvent.button1Down, isFalse);
    expect(pointerEvent.button2Down, isFalse);
    expect(pointerEvent.button3Down, isFalse);
    expect(pointerEvent.x, 50);
    expect(pointerEvent.y, 20);
  });

  testWidgets('sends pointer events while dragging', (
    final WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      _buildDetector(image: image, receivePort: receivePort),
    );

    final TestGesture gesture = await tester.createGesture(
      kind: ui.PointerDeviceKind.mouse,
      buttons: kPrimaryMouseButton,
    );
    await gesture.down(const Offset(10, 5));

    final RemoteFrameBufferIsolateSendMessagePointerEvent downEvent =
        await _nextPointerEvent(
      tester: tester,
      messages: messages,
    );
    expect(downEvent.button1Down, isTrue);
    expect(downEvent.x, 20);
    expect(downEvent.y, 10);

    await gesture.moveTo(const Offset(70, 25));

    final RemoteFrameBufferIsolateSendMessagePointerEvent dragEvent =
        await _nextPointerEvent(
      tester: tester,
      messages: messages,
    );
    expect(dragEvent.button1Down, isTrue);
    expect(dragEvent.x, 140);
    expect(dragEvent.y, 50);

    await gesture.up();

    final RemoteFrameBufferIsolateSendMessagePointerEvent upEvent =
        await _nextPointerEvent(
      tester: tester,
      messages: messages,
    );
    expect(upEvent.button1Down, isFalse);
    expect(upEvent.x, 140);
    expect(upEvent.y, 50);
  });

  testWidgets('preserves secondary and middle mouse button mapping', (
    final WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      _buildDetector(image: image, receivePort: receivePort),
    );

    final TestGesture secondaryGesture = await tester.createGesture(
      kind: ui.PointerDeviceKind.mouse,
      buttons: kSecondaryMouseButton,
    );
    await secondaryGesture.down(const Offset(10, 5));

    final RemoteFrameBufferIsolateSendMessagePointerEvent secondaryEvent =
        await _nextPointerEvent(
      tester: tester,
      messages: messages,
    );
    expect(secondaryEvent.button1Down, isFalse);
    expect(secondaryEvent.button2Down, isFalse);
    expect(secondaryEvent.button3Down, isTrue);

    await secondaryGesture.up();
    await _nextPointerEvent(
      tester: tester,
      messages: messages,
    );

    final TestGesture middleGesture = await tester.createGesture(
      kind: ui.PointerDeviceKind.mouse,
      buttons: kMiddleMouseButton,
    );
    await middleGesture.down(const Offset(10, 5));

    final RemoteFrameBufferIsolateSendMessagePointerEvent middleEvent =
        await _nextPointerEvent(
      tester: tester,
      messages: messages,
    );
    expect(middleEvent.button1Down, isFalse);
    expect(middleEvent.button2Down, isTrue);
    expect(middleEvent.button3Down, isFalse);

    await middleGesture.up();
  });
}

Widget _buildDetector({
  required final ui.Image image,
  required final ReceivePort receivePort,
}) =>
    SizedBox(
      width: 100,
      height: 50,
      child: RemoteFrameBufferGestureDetector(
        image: image,
        remoteFrameBufferWidgetSize: widgetSize,
        sendPort: some(receivePort.sendPort),
        child: RawImage(image: image),
      ),
    );

Future<RemoteFrameBufferIsolateSendMessagePointerEvent> _nextPointerEvent({
  required final WidgetTester tester,
  required final StreamIterator<dynamic> messages,
}) async =>
    (await tester.runAsync<RemoteFrameBufferIsolateSendMessagePointerEvent>(
      () async {
        expect(
          await messages.moveNext().timeout(const Duration(seconds: 1)),
          isTrue,
        );
        return messages.current
            as RemoteFrameBufferIsolateSendMessagePointerEvent;
      },
    ))!;
