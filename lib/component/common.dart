import 'package:flutter/material.dart';

Color lerpGradient(List<Color> colors, List<double> stops, double t) {
  for (var s = 0; s < stops.length - 1; s++) {
    final leftStop = stops[s], rightStop = stops[s + 1];
    final leftColor = colors[s], rightColor = colors[s + 1];
    if (t <= leftStop) {
      return leftColor;
    } else if (t < rightStop) {
      final sectionT = (t - leftStop) / (rightStop - leftStop);
      return Color.lerp(leftColor, rightColor, sectionT);
    }
  }
  return colors.last;
}

var colors = [
  Colors.red.shade400,
  Colors.red.shade200,
  Colors.blue.shade200,
  Colors.blue.shade400
];
var colorsDarker = [
  Colors.red.shade500,
  Colors.red.shade400,
  Colors.blue.shade400,
  Colors.blue.shade500
];
