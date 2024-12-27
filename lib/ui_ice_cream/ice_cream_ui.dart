import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_ui_examples/common/gen/assets.gen.dart';
import 'package:flutter_ui_examples/common/gen/fonts.gen.dart';
import 'package:flutter_ui_examples/ui_ice_cream/widget/ice_cream_icon_button.dart';
import 'package:gap/gap.dart';

class IceCreamUI extends HookWidget {
  const IceCreamUI({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF593AF),
      body: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              const Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Text(
                    'Ice Cream\nShop',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 48,
                      color: Colors.white,
                      fontFamily: FontFamily.ritts,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const Gap(50),
              Expanded(
                flex: 2,
                child: FractionalTranslation(
                  translation: const Offset(-.05, 0),
                  child: Transform.flip(
                    flipX: true,
                    child: Assets.images.iceCream.iceCreamChocolate.image(
                      height: MediaQuery.sizeOf(context).height,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            right: 30,
            bottom: 30,
            child: Row(
              children: <Widget>[
                const Text(
                  'Explore',
                  style: TextStyle(
                    fontSize: 20,
                    color: Color(0xFFFFFFFF),
                    fontFamily: FontFamily.museoSansCyrl,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const Gap(16),
                IceCreamIconButton(
                  path: Assets.svg.iceCream.arrowLeft,
                  size: const Size(60, 60),
                  padding: const EdgeInsets.all(12),
                  backgroundColor: const Color(0xFFF01359),
                  foregroundColor: const Color(0xFFFFFFFF),
                  onPress: () => Navigator.of(context).pushReplacementNamed(
                    '/ice_cream_main',
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
