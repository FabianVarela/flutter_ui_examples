import 'package:flutter/material.dart';
import 'package:flutter_ui_examples/shopping/shopping_ui.dart';
import 'package:flutter_ui_examples/story/story_ui.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //home: ShoppingUI(),
      home: StoryUI(),
    );
  }
}
