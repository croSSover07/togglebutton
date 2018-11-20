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
      onTap: () {
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
      },
      child: Center(
          child: Stack(
        children: <Widget>[
          AnimatedBuilder(
            animation: _animationController,
            child: Center(
              child: Container(
                width: 400,
                height: 400,
                child: new CustomPaint(
                  painter: BackgroundPaint(),
                ),
              ),
            ),
            builder: (BuildContext context, Widget _widget) {
              return new Transform.rotate(
                angle: _animationController.value * 3.15,
                child: _widget,
              );
            },
          ),
          Center(
              child: Text(_isActivated ? textOn : textOff,
                  style: TextStyle(color: Colors.white, fontSize: 32.0))),
        ],
      )),
    );
  }
}
