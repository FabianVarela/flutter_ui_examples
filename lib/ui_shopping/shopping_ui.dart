import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_ui_examples/common/gen/assets.gen.dart';
import 'package:flutter_ui_examples/ui_shopping/model/shopping_model.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

part 'widget/product_card.dart';

class ShoppingUI extends HookWidget {
  const ShoppingUI({required this.onPressedMenu, super.key});

  final VoidCallback onPressedMenu;

  @override
  Widget build(BuildContext context) {
    final currentIndex = useState(0);

    final bottomNavIconList = <Widget>[
      Assets.images.shopping.store.image(width: 35, height: 35),
      Assets.images.shopping.search.svg(width: 32, height: 32),
      Assets.images.shopping.favorite.svg(width: 32, height: 32),
      Assets.images.shopping.cart.svg(width: 32, height: 32),
      Assets.images.shopping.profile.image(width: 35, height: 35),
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: IconButton(
            icon: const Icon(Icons.menu, color: Colors.black),
            onPressed: onPressedMenu,
          ),
        ),
        title: Assets.images.shopping.logo.image(width: 62, height: 43),
      ),
      body: ListView.builder(
        itemCount: shoppingList.length,
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 30),
        itemBuilder: (_, index) => Padding(
          padding: const EdgeInsets.only(bottom: 32),
          child: _ProductCard(shopping: shoppingList[index]),
        ),
      ),
      bottomNavigationBar: DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.black12.withOpacity(0.065),
              offset: const Offset(0, -3),
              blurRadius: 10,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 20, bottom: 30),
          child: Row(
            children: bottomNavIconList.mapIndexed((index, item) {
              return Expanded(
                child: InkWell(
                  onTap: () => currentIndex.value = index,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      boxShadow: <BoxShadow>[
                        if (index == currentIndex.value)
                          BoxShadow(
                            color: Colors.black12.withOpacity(.2),
                            blurRadius: 10,
                          ),
                      ],
                    ),
                    child: item,
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
