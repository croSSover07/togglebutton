import 'package:flutter/material.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: ToggleButtonWidget(
          textOn: "On",
          textOff: "Off",
          onPressed: onPress,
          isActivated: false,
        ));
  }

  void onPress(bool isActivated) {
    print("isActivate: $isActivated");
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
