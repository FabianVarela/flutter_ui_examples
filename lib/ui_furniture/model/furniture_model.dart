import 'package:flutter_ui_examples/common/gen/assets.gen.dart';

class Furniture {
  Furniture({required this.image, required this.title, required this.price});

  final String image;
  final String title;
  final String price;
}

final furnitureList = <Furniture>[
  Furniture(
    image: Assets.images.furniture.hemes.path,
    title: 'Hemes ArmChair',
    price: '126',
  ),
  Furniture(
    image: Assets.images.furniture.sofa.path,
    title: 'Sofar ArmChair',
    price: '148',
  ),
  Furniture(
    image: Assets.images.furniture.wooden.path,
    title: 'Wooden ArmChair',
    price: '179',
  ),
];
