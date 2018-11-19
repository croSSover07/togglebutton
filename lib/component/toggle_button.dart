import 'dart:math';
import 'package:flutter/material.dart';

class ToggleButton extends CustomPainter {
  Rect _rect;

  var _shadow =
      const BoxShadow(color: const Color(0x55646464), blurRadius: 32.0);
  var _shadowOutSide =
      const BoxShadow(color: const Color(0xffd9d9d9), blurRadius: 32.0);

  @override
  void paint(Canvas canvas, Size size) {
    Offset center = new Offset(size.width / 2, size.height / 2);
    double radius = min(size.width / 2, size.height / 2);
    _rect = new Rect.fromCircle(center: center, radius: radius);

    canvas.drawCircle(center, radius,
        _shadowOutSide.toPaint()..blendMode = BlendMode.clear); //shadow outside
    canvas.drawCircle(center, radius, _getColorLine());

    canvas.drawCircle(center, radius * 0.85, _shadow.toPaint());
    canvas.drawCircle(center, radius * 0.85, _shadow.toPaint());
    canvas.drawCircle(center, radius * 0.85, _getColorLine());

    canvas.drawCircle(center, radius * 0.7, _shadow.toPaint());
    canvas.drawCircle(center, radius * 0.7, _shadow.toPaint());
    canvas.drawCircle(center, radius * 0.7, _getColorLine());
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }

  Paint _getColorLine() {
    var colors = [
      Colors.red.shade400,
      Colors.red.shade200,
      Colors.blue.shade200,
      Colors.blue.shade400
    ];

    return new Paint()
      ..style = PaintingStyle.fill
      ..strokeWidth = 32.0
      ..shader = new LinearGradient(
              colors: colors,
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter)
          .createShader(_rect);
  }
}
