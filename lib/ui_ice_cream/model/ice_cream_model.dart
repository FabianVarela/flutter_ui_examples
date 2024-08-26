import 'package:flutter_ui_examples/common/gen/assets.gen.dart';

class IceCreamModel {
  IceCreamModel({
    required this.name,
    required this.price,
    required this.rate,
    required this.image,
    this.energy = 0,
    this.calories = 0,
    this.calcium = 0,
    this.sugar = 0,
  });

  final String name;
  final double price;
  final int rate;
  final String image;
  final int energy;
  final int calories;
  final double calcium;
  final int sugar;
}

final iceCreamList = <IceCreamModel>[
  IceCreamModel(
    name: 'Strawberry',
    price: 5.89,
    rate: 4,
    image: Assets.images.iceCream.iceCreamStraw.path,
    energy: 1200,
    calories: 150,
    calcium: 20,
  ),
  IceCreamModel(
    name: 'Pistachio',
    price: 6.5,
    rate: 5,
    image: Assets.images.iceCream.iceCreamPistachio.path,
    energy: 1800,
    calories: 100,
    calcium: 40,
    sugar: 10,
  ),
];
