import 'dart:math';

import 'package:flutter/material.dart';
import 'common.dart';

class BackgroundPaint extends CustomPainter {
  static const double insideScaleRadius = 0.7;

  @override
  void paint(Canvas canvas, Size size) {
    Offset center = new Offset(size.width / 2, size.height / 2);
    double radius = min(size.width / 2, size.height / 2);
    var rect = new Rect.fromCircle(center: center, radius: radius);

    var colorPaint = Paint()
      ..style = PaintingStyle.fill
      ..strokeWidth = 32.0
      ..shader = new LinearGradient(
              colors: colors,
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter)
          .createShader(rect);

    var blurPaint = Paint()
      ..style = PaintingStyle.fill
      ..strokeWidth = 32.0
      ..maskFilter = MaskFilter.blur(BlurStyle.normal, 25.0)
      ..shader = new LinearGradient(
              colors: colorsDarker,
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter)
          .createShader(rect);

    canvas.drawCircle(center, radius, blurPaint);
    canvas.drawCircle(center, radius, colorPaint);

    canvas.drawCircle(center, radius * 0.85, blurPaint);
    canvas.drawCircle(center, radius * 0.85, colorPaint);

    canvas.drawCircle(center, radius * insideScaleRadius, blurPaint);
    canvas.drawCircle(center, radius * insideScaleRadius, colorPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
