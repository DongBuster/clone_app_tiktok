import 'package:flutter/material.dart';

class CustomBorder extends ShapeBorder {
  @override
  EdgeInsetsGeometry get dimensions => EdgeInsets.zero;

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) {
    return _buildPath(rect);
  }

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    return _buildPath(rect);
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {
    final path = _buildPath(rect);

    canvas.drawPath(path, Paint());
  }

  @override
  ShapeBorder scale(double t) => CustomBorder();

  Path _buildPath(Rect rect) {
    final size = rect.size;

    final path = Path();
    path.moveTo(0.5 * size.width, size.height * 0.35);
    path.cubicTo(0.2 * size.width, size.height * 0.05, -0.25 * size.width,
        size.height * 0.6, 0.5 * size.width, size.height);
    path.moveTo(0.5 * size.width, size.height * 0.35);
    path.cubicTo(0.8 * size.width, size.height * 0.05, 1.25 * size.width,
        size.height * 0.6, 0.5 * size.width, size.height);

    return path;
  }
}
