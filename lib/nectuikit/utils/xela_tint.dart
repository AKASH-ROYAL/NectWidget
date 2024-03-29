import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class NectTint extends SingleChildRenderObjectWidget {
  final Color color;

  const NectTint({
    Key? key,
    required this.color,
    required Widget child,
  })  : assert(color != null),
        super(key: key, child: child);

  @override
  RenderObject createRenderObject(BuildContext context) {
    return NectRenderTint(color: color, child: child as RenderBox);
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(ColorProperty('color', color));
  }
}

class NectRenderTint extends RenderProxyBox {
  NectRenderTint({
    Color color = Colors.transparent,
    RenderBox? child,
  })  : assert(color != null),
        _color = color,
        super(child);

  Color _color;

  Color get color => _color;

  set color(Color color) {
    assert(color != null);
    if (_color == color) return;
    _color = color;
    markNeedsPaint();
    markNeedsSemanticsUpdate();
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    if (child != null) {
      context.paintChild(child!, offset);
    }
    context.canvas.drawColor(color, BlendMode.srcOver);
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(ColorProperty('_color', _color));
  }
}
