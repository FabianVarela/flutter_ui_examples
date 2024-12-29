import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_ui_examples/common/gen/assets.gen.dart';
import 'package:flutter_ui_examples/common/gen/fonts.gen.dart';
import 'package:flutter_ui_examples/ui_ice_cream/model/ice_cream_model.dart';
import 'package:flutter_ui_examples/ui_ice_cream/widget/ice_cream_button.dart';
import 'package:flutter_ui_examples/ui_ice_cream/widget/ice_cream_icon_button.dart';
import 'package:flutter_ui_examples/ui_ice_cream/widget/ice_cream_quantity.dart';
import 'package:gap/gap.dart';

class IceCreamDetailArguments {
  IceCreamDetailArguments(this.iceCream);

  final IceCreamModel iceCream;
}

class IceCreamDetailUI extends HookWidget {
  const IceCreamDetailUI({required this.iceCream, super.key});

  final IceCreamModel iceCream;

  @override
  Widget build(BuildContext context) {
    final quantity = useState(1);
    final totalValue = useState<double>(iceCream.price);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  IceCreamIconButton(
                    path: Assets.svg.iceCream.arrowRight,
                    backgroundColor: const Color(0xFFF11359),
                    foregroundColor: const Color(0xFFFFFFFF),
                    onPress: () => Navigator.of(context).pop(),
                  ),
                  IceCreamIconButton(
                    path: Assets.svg.iceCream.bag,
                    backgroundColor: const Color(0xFFF11359),
                    foregroundColor: const Color(0xFFFFFFFF),
                  ),
                ],
              ),
              _IceCreamName(name: iceCream.name),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  _IceCreamDescription(iceCream: iceCream),
                  IceCreamQuantity(
                    iceCream: iceCream,
                    currentQuantity: quantity.value,
                    onChanged: (value) {
                      quantity.value = value;
                      totalValue.value = iceCream.price * value;
                    },
                  ),
                ],
              ),
              _IceCreamTotal(totalValue: totalValue.value),
              IceCreamButton(onPressed: () {}),
            ],
          ),
        ),
      ),
    );
  }
}

class _IceCreamName extends StatelessWidget {
  const _IceCreamName({required this.name});

  final String name;

  @override
  Widget build(BuildContext context) {
    return Text(
      '$name\nIce Cream',
      style: const TextStyle(
        fontSize: 30,
        color: Color(0xFFF593AF),
        fontFamily: FontFamily.ritts,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

class _IceCreamDescription extends StatelessWidget {
  const _IceCreamDescription({required this.iceCream});

  final IceCreamModel iceCream;

  @override
  Widget build(BuildContext context) {
    final calciumString = iceCream.calcium.toStringAsFixed(0);
    final descriptionList = <({String value, String symbol, String text})>[
      (value: '${iceCream.energy}', symbol: 'KL', text: 'Energy'),
      (value: '${iceCream.calories}', symbol: 'KCal', text: 'Calories'),
      (value: calciumString, symbol: '%', text: 'Calcium'),
      (value: '${iceCream.sugar}', symbol: '%', text: 'Sugar'),
    ];

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        for (final (index, item) in descriptionList.indexed) ...[
          RichText(
            text: TextSpan(
              text: item.value,
              style: const TextStyle(
                fontSize: 20,
                color: Color(0xFFF11359),
                fontFamily: FontFamily.museoSansCyrl,
                fontWeight: FontWeight.w600,
              ),
              children: <TextSpan>[
                TextSpan(
                  text: item.symbol,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Color(0xFFF11359),
                    fontFamily: FontFamily.museoSansCyrl,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ],
            ),
          ),
          Text(
            item.text,
            style: const TextStyle(
              fontSize: 12,
              color: Colors.grey,
              fontFamily: FontFamily.museoSansCyrl,
              fontWeight: FontWeight.w300,
            ),
          ),
          if (index <= descriptionList.length - 1) const Gap(20),
        ],
      ],
    );
  }
}

class _IceCreamTotal extends StatelessWidget {
  const _IceCreamTotal({required this.totalValue});

  final double totalValue;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Text(
          'Total:',
          style: TextStyle(
            fontSize: 28,
            color: Colors.grey,
            fontFamily: FontFamily.museoSansCyrl,
            fontWeight: FontWeight.w300,
          ),
        ),
        Text(
          '\$ ${totalValue.toStringAsFixed(1)}',
          style: const TextStyle(
            fontSize: 30,
            color: Color(0xFFF11359),
            fontFamily: FontFamily.museoSansCyrl,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
