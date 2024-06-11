import 'dart:ui';

import 'package:flutter_ui_examples/common/gen/assets.gen.dart';

class ShoppingModel {
  ShoppingModel(
    this.image,
    this.title,
    this.originalPrice,
    this.discountPrice,
    this.color,
  );

  final String image;
  final String title;
  final String originalPrice;
  final String discountPrice;
  final Color color;
}

final shoppingList = <ShoppingModel>[
  ShoppingModel(
    Assets.images.shopping.shoes01.path,
    'Hybrid Rocket WNS',
    r'$ 999.0',
    r'$ 749.0',
    const Color(0xFFFAECFB),
  ),
  ShoppingModel(
    Assets.images.shopping.shoes02.path,
    'Hybrid Runner ARS',
    r'$ 699.0',
    r'$ 599.0"',
    const Color(0xFFF8E1DA),
  ),
];
