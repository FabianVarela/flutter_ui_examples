import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_ui_examples/common/menu/custom_drawer.dart';
import 'package:flutter_ui_examples/common/menu/custom_hidden_menu.dart';
import 'package:flutter_ui_examples/ui_adidas_ecommerce/adidas_ui.dart';
import 'package:flutter_ui_examples/ui_beer/beer_ui.dart';
import 'package:flutter_ui_examples/ui_furniture/furniture_ui.dart';
import 'package:flutter_ui_examples/ui_ice_cream/ice_cream_main_ui.dart';
import 'package:flutter_ui_examples/ui_ice_cream/ice_cream_ui.dart';
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
        builder: (buildContext) => CustomHiddenMenu(
          isOpen: _isExpand,
          menu: CustomDrawer(
            isShowing: _isExpand,
            onRedirect: (route) {
              Navigator.of(buildContext).pushReplacementNamed(route);
            },
            onCloseMenu: () => setState(() => _isExpand = false),
          ),
          child: switch (settings.name) {
            '/login' => const LoginUI(),
            '/shopping' => ShoppingUI(onPressedMenu: _openDrawer),
            '/story' => StoryUI(onPressedMenu: _openDrawer),
            '/music' => MusicUI(onPressedMenu: _openDrawer),
            '/streaming' => StreamingUI(onPressedMenu: _openDrawer),
            '/furniture' => FurnitureUI(onPressedMenu: _openDrawer),
            '/adidas' => AdidasUI(onPressedMenu: _openDrawer),
            '/sneaky' => SneakyUI(onPressedMenu: _openDrawer),
            '/sneaky_detail' => _goToSneakyScreen(settings.arguments),
            '/beer' => BeerUI(onPressedMenu: _openDrawer),
            '/ice_cream' => const IceCreamUI(),
            '/ice_cream_main' => IceCreamMainUI(onPressedMenu: _openDrawer),
            '/' || _ => const OnBoardingUI(),
          },
        ),
      ),
    );
  }

  Widget _goToSneakyScreen(Object? arguments) {
    final args = arguments as SneakyDetailArguments?;
    return SneakyDetailUI(uuid: args!.uuid, sneaky: args.sneaky);
  }

  void _openDrawer() {
    setState(() => _isExpand = !_isExpand);
  }
}
