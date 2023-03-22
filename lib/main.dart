import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_ui_examples/common/custom_drawer.dart';
import 'package:flutter_ui_examples/common/custom_hidden_menu.dart';
import 'package:flutter_ui_examples/common/responsive.dart';
import 'package:flutter_ui_examples/ui_adidas_ecommerce/adidas.ui.dart';
import 'package:flutter_ui_examples/ui_furniture/furniture.ui.dart';
import 'package:flutter_ui_examples/ui_login/login.ui.dart';
import 'package:flutter_ui_examples/ui_music/music_ui.dart';
import 'package:flutter_ui_examples/ui_on_boarding/on_boarding.ui.dart';
import 'package:flutter_ui_examples/ui_shopping/shopping.ui.dart';
import 'package:flutter_ui_examples/ui_story/story.ui.dart';
import 'package:flutter_ui_examples/ui_streaming/streaming.ui.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations(
    <DeviceOrientation>[DeviceOrientation.portraitUp],
  );

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isExpand = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter UI examples',
      initialRoute: '/',
      onGenerateRoute: (RouteSettings settings) {
        return MaterialPageRoute<dynamic>(
          settings: settings,
          builder: (BuildContext ctx) {
            Responsive.init(
              ctx,
              width: MediaQuery.of(ctx).size.width,
              height: MediaQuery.of(ctx).size.height,
              allowFontScaling: true,
            );

            return CustomHiddenMenu(
              isOpen: _isExpand,
              menu: CustomDrawer(
                onCloseMenu: () => setState(() => _isExpand = false),
              ),
              child: _setRoute(settings.name),
            );
          },
        );
      },
    );
  }

  Widget _setRoute(String? routeName) {
    switch (routeName) {
      case '/login':
        return const LoginUI();
      case '/shopping':
        return ShoppingUI(onPressedMenu: _openDrawer);
      case '/story':
        return StoryUI(onPressedMenu: _openDrawer);
      case '/music':
        return MusicUI(onPressedMenu: _openDrawer);
      case '/streaming':
        return StreamingUI(onPressedMenu: _openDrawer);
      case '/furniture':
        return FurnitureUI(onPressedMenu: _openDrawer);
      case '/adidas':
        return AdidasUI(onPressedMenu: _openDrawer);
      case '/':
      default:
        return const OnBoardingUI();
    }
  }

  void _openDrawer() {
    setState(() => _isExpand = !_isExpand);
  }
}
