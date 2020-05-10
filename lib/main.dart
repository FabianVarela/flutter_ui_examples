import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_ui_examples/common/custom_drawer.dart';
import 'package:flutter_ui_examples/common/responsive.dart';
import 'package:flutter_ui_examples/ui_adidas_ecommerce/adidas.ui.dart';
import 'package:flutter_ui_examples/ui_furniture/furniture.ui.dart';
import 'package:flutter_ui_examples/ui_login/login.ui.dart';
import 'package:flutter_ui_examples/ui_music/music_ui.dart';
import 'package:flutter_ui_examples/ui_on_boarding/on_boarding.ui.dart';
import 'package:flutter_ui_examples/ui_shopping/shopping.ui.dart';
import 'package:flutter_ui_examples/ui_story/story.ui.dart';
import 'package:flutter_ui_examples/ui_streaming/streaming.ui.dart';
import 'package:hidden_drawer_menu/hidden_drawer/hidden_drawer_menu.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations(
      <DeviceOrientation>[DeviceOrientation.portraitUp]);

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
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

            return SimpleHiddenDrawer(
              isDraggable: false,
              menu: CustomDrawer(),
              screenSelectedBuilder:
                  (int position, SimpleHiddenDrawerBloc controller) {
                if (settings.name == '/' || settings.name == '/login') {
                  return _setRoute(settings.name);
                } else {
                  return _setScreenFromMenu(position, controller);
                }
              },
            );
          },
        );
      },
    );
  }

  Widget _setRoute(String routeName) {
    switch (routeName) {
      case '/':
        return OnBoardingUI();
      case '/login':
        return LoginUI();
      case '/shopping':
        return ShoppingUI(onPressedMenu: () {});
      default:
        return null;
    }
  }

  Widget _setScreenFromMenu(int position, SimpleHiddenDrawerBloc controller) {
    switch (position) {
      case 0:
        return ShoppingUI(onPressedMenu: controller.toggle);
      case 1:
        return StoryUI(onPressedMenu: controller.toggle);
      case 2:
        return MusicUI(onPressedMenu: controller.toggle);
      case 3:
        return StreamingUI(onPressedMenu: controller.toggle);
      case 4:
        return FurnitureUI(onPressedMenu: controller.toggle);
      case 5:
        return AdidasUI(onPressedMenu: controller.toggle);
      default:
        return null;
    }
  }
}
