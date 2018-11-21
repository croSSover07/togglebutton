import 'dart:math';

import 'package:flutter/material.dart';

import 'background_paint.dart';

class ToggleButtonWidget extends StatefulWidget {
  final String textOn;
  final String textOff;
  Function(bool) onPressed;

  bool isActivated = false;

  ToggleButtonWidget(
      {this.textOn, this.textOff, this.onPressed, this.isActivated});

  @override
  State<StatefulWidget> createState() => _ToggleButtonState(
      textOn: textOn,
      textOff: textOff,
      onPressed: onPressed,
      isActivate: isActivated);
}

class _ToggleButtonState extends State<StatefulWidget>
    with SingleTickerProviderStateMixin {
  static const double size = 400;

  final String textOn;
  final String textOff;

  Function(bool) onPressed;
  bool _isActivated = false;
  AnimationController _animationController;

  set isActivated(bool value) {
    setState(() {
      _isActivated = value;
    });
  }

  bool get isActivated => _isActivated;

  _ToggleButtonState(
      {this.textOn, this.textOff, this.onPressed, bool isActivate}) {
    _isActivated = isActivate;
  }

  @override
  void initState() {
    super.initState();

    _animationController = new AnimationController(
      vsync: this,
      duration: new Duration(milliseconds: 100),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onTap,
      child: Center(
          child: Stack(
        children: <Widget>[
          AnimatedBuilder(
            animation: _animationController,
            child: Center(
              child: Container(
                width: size,
                height: size,
                child: new CustomPaint(
                  painter: BackgroundPaint(),
                ),
              ),
            ),
            builder: (BuildContext context, Widget _widget) {
              return new Transform.rotate(
                angle: _animationController.value * pi,
                child: _widget,
              );
            },
          ),
          Center(
              child: RaisedButton(
            onPressed: _onTap,
            shape: new CircleBorder(),
            disabledColor: Colors.transparent,
            color: Colors.transparent,
            elevation: 0,
            highlightElevation: 0,
            disabledElevation: 0,
            highlightColor: Colors.transparent,
            splashColor: Colors.white30,
            child: Container(
              width: size * BackgroundPaint.insideScaleRadius,
              height: size * BackgroundPaint.insideScaleRadius,
              child: Center(
                child: Text(_isActivated ? textOn : textOff,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 109.0, //hot fix for pixel XL  (must be <110.0)
                        fontStyle: FontStyle.italic)),
              ),
            ),
          )),
        ],
      )),
    );
  }

  void _onTap() {
    if (onPressed != null) {
      setState(() {
        _isActivated = !_isActivated;
        if (_isActivated) {
          _animationController.forward();
        } else {
          _animationController.reverse();
        }
        onPressed(_isActivated);
      });
    }
  }
}
