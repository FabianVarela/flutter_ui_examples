import 'package:flutter/material.dart';
import 'package:flutter_ui_examples/furniture/furniture_ui.dart';
import 'package:flutter_ui_examples/music/music_ui.dart';
import 'package:flutter_ui_examples/on_boarding/on_boarding_ui.dart';
import 'package:flutter_ui_examples/shopping/shopping_ui.dart';
import 'package:flutter_ui_examples/story/story_ui.dart';
import 'package:flutter_ui_examples/streaming/streaming_ui.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //home: ShoppingUI(),
      //home: StoryUI(),
      //home: MusicUI(),
      //home: StreamingUI(),
      //home: OnBoardingUI(),
      home: FurnitureUI(),
    );
  }
}
