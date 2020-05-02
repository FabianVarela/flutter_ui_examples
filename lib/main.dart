import 'package:flutter/material.dart';
import 'package:flutter_ui_examples/ui_on_boarding/on_boarding.ui.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: OnBoardingUI(),
    );
  }
}
