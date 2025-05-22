import 'package:flutter/material.dart';
import 'package:flutter_ui_examples/common/gen/assets.gen.dart';

class SneakyCategory {
  SneakyCategory({
    required this.name,
    required this.quantity,
    required this.sneakyList,
  });

  final String name;
  final int quantity;
  final List<Sneaky> sneakyList;
}

class Sneaky {
  Sneaky({
    required this.image,
    required this.name,
    required this.description,
    required this.price,
    required this.colors,
    required this.sizes,
  });

  final String image;
  final String name;
  final String description;
  final double price;
  final List<Color> colors;
  final List<SneakySize> sizes;
}

class SneakySize {
  SneakySize({required this.size, this.isAvailable = false});

  final int size;
  final bool isAvailable;
}

const description =
    "A remarkable shoe that's naturally soft, cozy all over, "
    'and fits your every move.\n Lorem ipsum dolor sit amet, consectetur '
    'adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore '
    'magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco '
    'laboris nisi ut aliquip ex ea';

final _sneakyList = <Sneaky>[
  Sneaky(
    image: Assets.images.sneaky.blackSneaky.path,
    name: 'Men casual runners',
    description: description,
    price: 96.99,
    colors: <Color>[
      Colors.black,
      Colors.red,
      Colors.lightBlue,
      Colors.yellowAccent,
      Colors.green,
    ],
    sizes: <SneakySize>[
      SneakySize(size: 8, isAvailable: true),
      SneakySize(size: 9, isAvailable: true),
      SneakySize(size: 10),
      SneakySize(size: 11, isAvailable: true),
      SneakySize(size: 12, isAvailable: true),
    ],
  ),
  Sneaky(
    image: Assets.images.sneaky.blueSneaky.path,
    name: 'Women casual runners',
    description: description,
    price: 98.99,
    colors: <Color>[
      Colors.black,
      Colors.red,
      Colors.lightBlue,
      Colors.yellowAccent,
      Colors.green,
    ],
    sizes: <SneakySize>[
      SneakySize(size: 6),
      SneakySize(size: 7, isAvailable: true),
      SneakySize(size: 8, isAvailable: true),
      SneakySize(size: 9, isAvailable: true),
      SneakySize(size: 10, isAvailable: true),
    ],
  ),
  Sneaky(
    image: Assets.images.sneaky.redSneaky.path,
    name: 'Child casual runners',
    description: description,
    price: 89.99,
    colors: <Color>[
      Colors.black,
      Colors.red,
      Colors.lightBlue,
      Colors.yellowAccent,
      Colors.green,
    ],
    sizes: <SneakySize>[
      SneakySize(size: 3, isAvailable: true),
      SneakySize(size: 4, isAvailable: true),
      SneakySize(size: 5),
      SneakySize(size: 6, isAvailable: true),
    ],
  ),
  Sneaky(
    image: Assets.images.sneaky.yellowSneaky.path,
    name: 'Unisex casual runners',
    description: description,
    price: 100.99,
    colors: <Color>[
      Colors.black,
      Colors.red,
      Colors.lightBlue,
      Colors.yellowAccent,
      Colors.green,
    ],
    sizes: <SneakySize>[
      SneakySize(size: 8, isAvailable: true),
      SneakySize(size: 9, isAvailable: true),
      SneakySize(size: 10, isAvailable: true),
      SneakySize(size: 11, isAvailable: true),
      SneakySize(size: 12),
    ],
  ),
];

final sneakyCategories = <SneakyCategory>[
  SneakyCategory(name: 'Casual', quantity: 80, sneakyList: _sneakyList),
  SneakyCategory(name: 'Sporty', quantity: 30, sneakyList: _sneakyList),
];
