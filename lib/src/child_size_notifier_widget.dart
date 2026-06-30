import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

/// Widget that exposes its child's laid-out size via a [ValueNotifier].
class SizeTrackingWidget extends SingleChildRenderObjectWidget {
  final ValueNotifier<Size> _sizeValueNotifier;

  const SizeTrackingWidget({
    super.key,
    required final ValueNotifier<Size> sizeValueNotifier,
    required final Widget child,
  })  : _sizeValueNotifier = sizeValueNotifier,
        super(child: child);

  @override
  RenderObject createRenderObject(final BuildContext context) =>
      _SizeTrackingRenderObject(sizeValueNotifier: _sizeValueNotifier);

  @override
  void updateRenderObject(
    final BuildContext context,
    final RenderObject renderObject,
  ) =>
      (renderObject as _SizeTrackingRenderObject).updateSizeValueNotifier(
        _sizeValueNotifier,
      );
}

class _SizeTrackingRenderObject extends RenderProxyBox {
  ValueNotifier<Size> _sizeValueNotifier;
  Size? _pendingSize;

  _SizeTrackingRenderObject({
    required final ValueNotifier<Size> sizeValueNotifier,
  }) : _sizeValueNotifier = sizeValueNotifier;

  void updateSizeValueNotifier(final ValueNotifier<Size> value) {
    if (_sizeValueNotifier == value) {
      return;
    }
    _sizeValueNotifier = value;
    _scheduleSizeNotification();
  }

  @override
  void performLayout() {
    super.performLayout();
    _scheduleSizeNotification();
  }

  void _scheduleSizeNotification() {
    if (!hasSize || _sizeValueNotifier.value == size || _pendingSize == size) {
      return;
    }

    final Size scheduledSize = size;
    _pendingSize = scheduledSize;
    WidgetsBinding.instance.addPostFrameCallback((final _) {
      if (_pendingSize != scheduledSize) {
        return;
      }

      _pendingSize = null;
      if (_sizeValueNotifier.value != scheduledSize) {
        _sizeValueNotifier.value = scheduledSize;
      }
    });
  }
}
