import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_ui_examples/common/gen/fonts.gen.dart';
import 'package:flutter_ui_examples/ui_sneaky/model/sneaky_model.dart';
import 'package:flutter_ui_examples/ui_sneaky/widget/custom_icon_button.dart';
import 'package:gap/gap.dart';

part 'widget/detail/control_360.dart';

part 'widget/detail/custom_button.dart';

part 'widget/detail/sneaky_color_list.dart';

part 'widget/detail/sneaky_size_list.dart';

class SneakyDetailArguments {
  SneakyDetailArguments(this.sneaky, this.uuid);

  final Sneaky sneaky;
  final String uuid;
}

class SneakyDetailUI extends HookWidget {
  const SneakyDetailUI({required this.sneaky, required this.uuid, super.key});

  final Sneaky sneaky;
  final String uuid;

  @override
  Widget build(BuildContext context) {
    final currentValue = useState<double>(360);
    final isDisableScroll = useState(false);

    return Scaffold(
      backgroundColor: Colors.white.withOpacity(.9),
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Positioned.fill(
              child: SingleChildScrollView(
                physics: isDisableScroll.value
                    ? const NeverScrollableScrollPhysics()
                    : const AlwaysScrollableScrollPhysics(),
                padding: const EdgeInsets.fromLTRB(16, 10, 16, 30),
                child: Stack(
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Hero(tag: uuid, child: Image.asset(sneaky.image)),
                        const Gap(20),
                        Text(
                          '\$ ${sneaky.price.toStringAsFixed(2)}',
                          style: const TextStyle(
                            fontFamily: FontFamily.poetsenOne,
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Gap(10),
                        Text(
                          sneaky.name,
                          style: const TextStyle(
                            fontFamily: FontFamily.avenirLTStd,
                            fontSize: 25,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const Gap(30),
                        _SneakyColorList(colors: sneaky.colors),
                        const Gap(30),
                        _SneakySizeList(sizes: sneaky.sizes),
                        const Gap(50),
                        Text(
                          sneaky.description,
                          style: const TextStyle(
                            fontFamily: FontFamily.avenirLTStd,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const Gap(50),
                      ],
                    ),
                    FractionalTranslation(
                      translation: const Offset(.55, .9),
                      child: _Control360(
                        value: currentValue.value,
                        onChangeValue: (value) => currentValue.value = value,
                        onDisableScroll: (value) {
                          isDisableScroll.value = value;
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              left: 16,
              right: 16,
              bottom: 10,
              child: Row(
                children: <Widget>[
                  CustomIconButton(
                    iconData: Icons.arrow_back,
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: _CustomButton(
                        text: 'Add to bag'.toUpperCase(),
                        onPressed: () {},
                      ),
                    ),
                  ),
                  CustomIconButton(
                    iconData: Icons.email_outlined,
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
