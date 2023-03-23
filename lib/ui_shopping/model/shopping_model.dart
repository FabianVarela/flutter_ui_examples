import 'dart:ui';

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
    'assets/images/shopping/shoes_01.png',
    'Hybrid Rocket WNS',
    r'$ 999.0',
    r'$ 749.0',
    const Color(0xFFFAECFB),
  ),
  ShoppingModel(
    'assets/images/shopping/shoes_02.png',
    'Hybrid Runner ARS',
    r'$ 699.0',
    r'$ 599.0"',
    const Color(0xFFF8E1DA),
  ),
];
