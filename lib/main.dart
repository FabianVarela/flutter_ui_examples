import 'package:flutter/material.dart';
import 'package:flutter_ui_examples/common/responsive.dart';
import 'package:flutter_ui_examples/ui_adidas_ecommerce/adidas.ui.dart';
import 'package:flutter_ui_examples/ui_furniture/furniture.ui.dart';
import 'package:flutter_ui_examples/ui_login/login.ui.dart';
import 'package:flutter_ui_examples/ui_music/music_ui.dart';
import 'package:flutter_ui_examples/ui_on_boarding/on_boarding.ui.dart';
import 'package:flutter_ui_examples/ui_shopping/shopping.ui.dart';
import 'package:flutter_ui_examples/ui_story/story.ui.dart';
import 'package:flutter_ui_examples/ui_streaming/streaming.ui.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter UI examples',
      initialRoute: '/',
      onGenerateRoute: (RouteSettings settings) {
        return MaterialPageRoute<dynamic>(
          settings: settings,
          builder: (BuildContext ctx) {
            final double width = MediaQuery.of(ctx).size.width;
            final double height = MediaQuery.of(ctx).size.height;

            Responsive.init(ctx,
                width: width, height: height, allowFontScaling: true);

            switch (settings.name) {
              case '/':
                return OnBoardingUI();
              case '/login':
                return LoginUI();
              case '/shopping':
                return ShoppingUI();
              case '/story':
                return StoryUI();
              case '/music':
                return MusicUI();
              case '/streaming':
                return StreamingUI();
              case '/furniture':
                return FurnitureUI();
              case '/e-commerce':
                return AdidasUI();
              default:
                return null;
            }
          },
        );
      },
    );
  }
}
