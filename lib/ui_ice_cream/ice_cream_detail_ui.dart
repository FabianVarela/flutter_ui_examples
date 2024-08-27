import 'package:flutter/material.dart';
import 'package:flutter_ui_examples/common/gen/assets.gen.dart';
import 'package:flutter_ui_examples/ui_ice_cream/model/ice_cream_model.dart';
import 'package:flutter_ui_examples/ui_ice_cream/widget/option_button.dart';

class IceCreamDetailArguments {
  IceCreamDetailArguments(this.iceCream);

  final IceCreamModel iceCream;
}

class IceCreamDetailUI extends StatelessWidget {
  const IceCreamDetailUI({required this.iceCream, super.key});

  final IceCreamModel iceCream;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  OptionButton(
                    path: Assets.images.iceCream.arrowRight.path,
                    backgroundColor: const Color(0xFFF11359),
                    foregroundColor: const Color(0xFFFFFFFF),
                    onPress: () => Navigator.of(context).pop(),
                  ),
                  OptionButton(
                    path: Assets.images.iceCream.bag.path,
                    backgroundColor: const Color(0xFFF11359),
                    foregroundColor: const Color(0xFFFFFFFF),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
