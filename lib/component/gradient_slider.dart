import 'package:flutter/material.dart';

class GragientSlider extends CustomPainter {
  final double value;

  static var _colors = [
    Colors.red.shade500,
    Colors.yellow.shade500,
    Colors.blue.shade500
  ];

  GragientSlider({@required this.value}) : assert(value >= 0.0 && value <= 1.0);

  @override
  void paint(Canvas canvas, Size size) {
    Offset start = Offset(0, size.height / 2);
    Offset end = Offset(size.width, size.height / 2);

    var rect = new Rect.fromLTRB(0, 0, size.width, size.height);

    var blurPaint = Paint()
      ..style = PaintingStyle.fill
      ..strokeWidth = size.height
      ..shader = new LinearGradient(
              colors: _colors,
              begin: Alignment.centerLeft,
              end: Alignment.centerRight)
          .createShader(rect);

    canvas.drawLine(start, end, blurPaint);

    var pointWidth = size.width / 25.0;
    var pointPosition = size.width * value;

    canvas.drawRect(
        new Rect.fromLTWH(pointPosition, 0, pointWidth, size.height),
        Paint()..color = Colors.transparent.withAlpha(128));
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
