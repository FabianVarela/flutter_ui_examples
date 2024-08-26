import 'dart:ui';

import 'package:flutter_ui_examples/common/gen/assets.gen.dart';

class ShoppingModel {
  ShoppingModel({
    required this.image,
    required this.title,
    required this.originalPrice,
    required this.discountPrice,
    required this.color,
  });

  final String image;
  final String title;
  final String originalPrice;
  final String discountPrice;
  final Color color;
}

final shoppingList = <ShoppingModel>[
  ShoppingModel(
    image: Assets.images.shopping.shoes01.path,
    title: 'Hybrid Rocket WNS',
    originalPrice: r'$ 999.0',
    discountPrice: r'$ 749.0',
    color: const Color(0xFFFAECFB),
  ),
  ShoppingModel(
    image: Assets.images.shopping.shoes02.path,
    title: 'Hybrid Runner ARS',
    originalPrice: r'$ 699.0',
    discountPrice: r'$ 599.0"',
    color: const Color(0xFFF8E1DA),
  ),
];
