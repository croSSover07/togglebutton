import 'package:flutter/material.dart';

class GradientSlider extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _GradientSliderState();
}

class _GradientSliderState extends State<GradientSlider> {

  double percent = 0.0;

  GlobalKey _sliderKey = GlobalKey();
  double _leftEdge = 0.0;
  double _rightEdge = 0.0;
  double _width = 0.0;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(_afterLayout);
    super.initState();
  }

  void _afterLayout(_) {
    RenderBox renderBox = _sliderKey.currentContext.findRenderObject();
    var position = renderBox.localToGlobal(Offset.zero);

    _leftEdge = position.dx;
    _rightEdge = position.dx + renderBox.size.width;
    _width = renderBox.size.width;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {},
        onPanStart: (DragStartDetails details) {
          var position = details.globalPosition.dx;
          _onClick(position);
        },
        onPanUpdate: (DragUpdateDetails details) {
          var position = details.globalPosition.dx;
          _onClick(position);
        },
        onTapUp: (TapUpDetails details) {
          var position = details.globalPosition.dx;
          _onClick(position);
        },
        onTapDown: (TapDownDetails details) {
          var position = details.globalPosition.dx;
          _onClick(position);
        },
        child: Container(
          constraints: BoxConstraints.expand(height: 32.0),
          child: CustomPaint(
            key: _sliderKey,
            painter: GragientSliderPaint(value: this.percent),
          ),
        ));
  }

  void _onClick(double position) {
    if (position >= _leftEdge && position <= _rightEdge) {
      double distance = position - _leftEdge;
      setState(() {
        percent = distance / _width;
      });
    }
  }
}

class GragientSliderPaint extends CustomPainter {
  final double value;

  static var _colors = [
    Colors.red.shade500,
    Colors.yellow.shade500,
    Colors.blue.shade500
  ];

  GragientSliderPaint({@required this.value})
      : assert(value >= 0.0 && value <= 1.0);

  @override
  void paint(Canvas canvas, Size size) {
    Offset start = Offset(0, size.height / 2);
    Offset end = Offset(size.width, size.height / 2);

    var rect = new Rect.fromLTWH(0, 0, size.width, size.height);

    var blurPaint = Paint()
      ..style = PaintingStyle.fill
      ..strokeWidth = size.height
      ..shader = new LinearGradient(
              colors: _colors,
              begin: Alignment.centerLeft,
              end: Alignment.centerRight)
          .createShader(rect);

    canvas.drawLine(start, end, blurPaint);

    var pointWidth = size.width / 30.0;
    var pointPosition = size.width * value - pointWidth / 2;

    canvas.drawRect(
        new Rect.fromLTWH(pointPosition, 0, pointWidth, size.height),
        Paint()..color = Colors.transparent.withAlpha(128));
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
