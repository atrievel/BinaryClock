import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show SystemChrome, DeviceOrientation;

import './clock.dart';

void main() {
  // force the app to bind first before changing the orientation
  WidgetsFlutterBinding.ensureInitialized();

  // start the app in landscape mode to fit the clock on the screen
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Alatsi',
        brightness: Brightness.dark,
        textTheme: TextTheme(
          headline4: TextStyle(color: Colors.black38, fontSize: 30),
        ),
      ),
      home: Scaffold(
        body: Clock(),
      ),
    );
  }
}
