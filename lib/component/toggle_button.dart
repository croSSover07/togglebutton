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

class _ToggleButtonState extends State<StatefulWidget> {
  final String textOn;
  final String textOff;

  Function(bool) onPressed;
  bool _isActivated = false;

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
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (onPressed != null) {
          setState(() {
            _isActivated = !_isActivated;
            onPressed(_isActivated);
          });
        }
      },
      child: Center(
        child: Container(
          width: 400,
          height: 400,
          child: new CustomPaint(
            painter: BackgroundPaint(),
            child: Center(
                child: Text(_isActivated ? textOn : textOff,
                    style: TextStyle(color: Colors.white, fontSize: 32.0))),
          ),
        ),
      ),
    );
  }
}
