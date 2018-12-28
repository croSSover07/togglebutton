import 'package:flutter/material.dart';

import 'common.dart';
import 'gradient_slider.dart';
import 'toggle_button.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Toggle button',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Toggle button'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Color colorFirst = colors[0];
  Color colorSecond = colors[colors.length - 1];

  bool _isActivated = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                ToggleButtonWidget(
                  textOn: "On",
                  textOff: "Off",
                  onPressed: onPress,
                  isActivated: _isActivated,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                  child: GradientSlider(fun: onSlideFirst),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                  child: GradientSlider(fun: onSlideSecond),
                ),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.only(top: 32),
                        decoration: BoxDecoration(
                            color: this.colorFirst, shape: BoxShape.circle),
                        width: 100,
                        height: 100,
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 32),
                        decoration: BoxDecoration(
                            color: this.colorSecond, shape: BoxShape.circle),
                        width: 100,
                        height: 100,
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }

  void onPress(bool isActivated) {
    _isActivated = isActivated;
  }

  void onSlideFirst(Color color) {
    setState(() {
      this.colorFirst = color;
      var hslColor = HSLColor.fromColor(color);

      colors[0] = hslColor.withLightness(0.6).toColor();
      colors[1] = hslColor.withLightness(0.8).toColor();

      colorsDarker[0] = hslColor.withLightness(0.5).toColor();
      colorsDarker[1] = hslColor.withLightness(0.6).toColor();
    });
  }

  void onSlideSecond(Color color) {
    setState(() {
      this.colorSecond = color;
      var hslColor = HSLColor.fromColor(color);

      colors[2] = hslColor.withLightness(0.6).toColor();
      colors[3] = hslColor.withLightness(0.8).toColor();

      colorsDarker[2] = hslColor.withLightness(0.5).toColor();
      colorsDarker[3] = hslColor.withLightness(0.6).toColor();
    });
  }

  List<Widget> _another() {
    return [
      Center(
        child: new Stack(
          alignment: AlignmentDirectional.center,
          children: <Widget>[
            new Container(
              width: 400,
              height: 400,
              decoration: new BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.blue,
                gradient: new LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.red.shade400, Colors.blue.shade400],
                ),
              ),
            ),

            new Container(
              width: 400,
              height: 400,
              decoration: new BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.transparent,
                border: new Border.all(
                  color: const Color(0x80ffffff),
                  width: 25,
                ),
              ),
            ),

//          new Container(
//            width: 350,
//            height: 350,
//            decoration: new BoxDecoration(
//              shape: BoxShape.circle,
//              color: Colors.transparent,
//              border: new Border.all(
//                color: Colors.transparent,
//                width: 25,
//              ),
//            ),
//          ),

//          new Container(
//            width: 300,
//            height: 300,
//            decoration: new BoxDecoration(
//              shape: BoxShape.circle,
//              color: Colors.transparent,
//              border: new Border.all(
//                color: const Color(0x30ffffff),
//                width: 25,
//              ),
//            ),
//          ),

            new Container(
              width: 300,
              height: 300,
              decoration: new BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.transparent,
                border: new Border.all(
                  color: const Color(0x681D1D1D),
                  width: 1.5,
                ),
              ),
            ),
          ],
        ),
      )
    ];
  }
}
