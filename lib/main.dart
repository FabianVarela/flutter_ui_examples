import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_ui_examples/common/menu/custom_drawer.dart';
import 'package:flutter_ui_examples/common/menu/custom_hidden_menu.dart';
import 'package:flutter_ui_examples/common/responsive.dart';
import 'package:flutter_ui_examples/ui_adidas_ecommerce/adidas_ui.dart';
import 'package:flutter_ui_examples/ui_beer/beer_ui.dart';
import 'package:flutter_ui_examples/ui_furniture/furniture_ui.dart';
import 'package:flutter_ui_examples/ui_login/login_ui.dart';
import 'package:flutter_ui_examples/ui_music/music_ui.dart';
import 'package:flutter_ui_examples/ui_on_boarding/on_boarding_ui.dart';
import 'package:flutter_ui_examples/ui_shopping/shopping_ui.dart';
import 'package:flutter_ui_examples/ui_sneaky/sneaky_detail_ui.dart';
import 'package:flutter_ui_examples/ui_sneaky/sneaky_ui.dart';
import 'package:flutter_ui_examples/ui_story/story_ui.dart';
import 'package:flutter_ui_examples/ui_streaming/streaming_ui.dart';

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
      onGenerateRoute: (settings) => MaterialPageRoute<dynamic>(
        settings: settings,
        builder: (ctx) {
          final w = MediaQuery.of(ctx).size.width;
          final h = MediaQuery.of(ctx).size.height;
          Responsive.init(ctx, width: w, height: h, allowFontScaling: true);

          return CustomHiddenMenu(
            isOpen: _isExpand,
            menu: CustomDrawer(
              isShowing: _isExpand,
              onRedirect: (route) {
                Navigator.of(ctx).pushReplacementNamed(route);
              },
              onCloseMenu: () => setState(() => _isExpand = false),
            ),
            child: _setRoute(settings),
          );
        },
      ),
    );
  }

  Widget _setRoute(RouteSettings settings) {
    switch (settings.name) {
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
      case '/sneaky':
        return SneakyUI(onPressedMenu: _openDrawer);
      case '/sneaky_detail':
        final args = settings.arguments as SneakyDetailArguments?;
        return SneakyDetailUI(uuid: args!.uuid, sneaky: args.sneaky);
      case '/beer':
        return BeerUI(onPressedMenu: _openDrawer);
      case '/':
      default:
        return const OnBoardingUI();
    }
  }

  void _openDrawer() {
    setState(() => _isExpand = !_isExpand);
  }
}
