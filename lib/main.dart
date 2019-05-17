import 'package:flutter/material.dart';
import 'package:flutter_ui_examples/on_boarding/on_boarding_ui.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: OnBoardingUI());
  }
}
