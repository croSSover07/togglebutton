import 'dart:math';

import 'package:flutter/material.dart';

class ToggleButton extends CustomPainter {
  final _random = new Random();
  Rect rect;

  @override
  void paint(Canvas canvas, Size size) {

    Offset center = new Offset(size.width / 2, size.height / 2);
    double radius = min(size.width / 2, size.height / 2);
    rect = new Rect.fromCircle(center: center, radius: radius);

    var line = new Paint()
      ..color = Colors.grey
      ..style = PaintingStyle.fill;

    canvas.drawCircle(center, radius, line);

//    canvas.drawArc(rect, -pi / 2, 2 * pi, false, _getColorLine(true));
      canvas.drawCircle(center, radius, _getColorLine());
//      canvas.drawShadow(path, color, elevation, transparentOccluder)
      
//      canvas.ma

//    canvas.drawArc(rect, -pi / 2 + pi / 4, pi / 4, true, _getColorLine(true));
//    canvas.drawArc(rect, -pi / 2 + pi / 2, pi / 4, true, _getColorLine(true));
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }

  Paint _getColorLine( ) {

    var colors = [
      Colors.red.shade300,
      Colors.blue.shade300
    ];

    return new Paint()
      ..style = PaintingStyle.fill
      ..strokeWidth = 32.0
      ..shader = new LinearGradient(
              colors: colors,
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter)
          .createShader(rect);
  }

  Color _randomColor() {
    var a = 255; // alpha = 0..255
    var r = _random.nextInt(256); // red = 0..255
    var g = _random.nextInt(256); // green = 0..255
    var b = _random.nextInt(256); // blue = 0..255
    return Color.fromARGB(a, r, g, b);
  }
}
