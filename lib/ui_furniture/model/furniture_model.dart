import 'package:flutter_ui_examples/common/gen/assets.gen.dart';

class Furniture {
  Furniture(this.image, this.title, this.price);

  final String image;
  final String title;
  final String price;
}

final furnitureList = <Furniture>[
  Furniture(Assets.images.furniture.hemes.path, 'Hemes ArmChair', '126'),
  Furniture(Assets.images.furniture.sofa.path, 'Sofar ArmChair', '148'),
  Furniture(Assets.images.furniture.wooden.path, 'Wooden ArmChair', '179'),
];
