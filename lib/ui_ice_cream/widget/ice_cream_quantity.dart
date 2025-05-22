import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_ui_examples/common/gen/fonts.gen.dart';
import 'package:flutter_ui_examples/ui_ice_cream/model/ice_cream_model.dart';
import 'package:flutter_ui_examples/ui_ice_cream/widget/ice_cream_circle_button.dart';
import 'package:gap/gap.dart';

class IceCreamQuantity extends HookWidget {
  const IceCreamQuantity({
    required this.iceCream,
    required this.currentQuantity,
    this.onChanged,
    super.key,
  });

  final IceCreamModel iceCream;
  final int currentQuantity;
  final ValueSetter<int>? onChanged;

  @override
  Widget build(BuildContext context) {
    final sizes = <String>['S', 'M', 'L'];
    final currentSize = useState(sizes.first);

    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: <Widget>[
        SizedBox.fromSize(
          size: Size(200, MediaQuery.sizeOf(context).height * .4),
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: const Color(0xFFfAD4DE),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: const EdgeInsets.all(6),
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: const Color(0xFFF593AF),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          for (final item in sizes)
                            IceCreamCircleButton(
                              onPressed: () => currentSize.value = item,
                              color: currentSize.value == item
                                  ? const Color(0xFFF01359)
                                  : Colors.transparent,
                              child: Text(
                                item,
                                style: const TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontFamily: FontFamily.museoSansCyrl,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                        ],
                      ),
                      const Gap(30),
                      const Text(
                        'Qty.',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontFamily: FontFamily.museoSansCyrl,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const Gap(10),
                      _QuantityButtons(
                        quantity: currentQuantity,
                        onChanged: onChanged,
                      ),
                      const Gap(20),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        Positioned(
          top: -40,
          child: SizedBox.fromSize(
            size: const Size(180, 180),
            child: Hero(
              tag: '${iceCream.name}_${iceCream.rate}',
              transitionOnUserGestures: true,
              child: Image.asset(iceCream.image, fit: BoxFit.contain),
            ),
          ),
        ),
      ],
    );
  }
}

class _QuantityButtons extends StatelessWidget {
  const _QuantityButtons({this.quantity = 0, this.onChanged});

  final int quantity;
  final ValueSetter<int>? onChanged;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: const Color(0xFFfAD4DE),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IceCreamCircleButton(
              onPressed: quantity > 1
                  ? () => onChanged?.call(quantity - 1)
                  : null,
              child: const Icon(Icons.remove, color: Color(0xFFF01359)),
            ),
            Text(
              '$quantity',
              style: const TextStyle(
                fontSize: 22,
                color: Color(0xFFF01359),
                fontFamily: FontFamily.museoSansCyrl,
                fontWeight: FontWeight.w600,
              ),
            ),
            IceCreamCircleButton(
              onPressed: quantity < 20
                  ? () => onChanged?.call(quantity + 1)
                  : null,
              color: const Color(0xFFF01359),
              child: const Icon(Icons.add, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
