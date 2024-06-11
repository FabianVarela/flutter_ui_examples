import 'package:flutter/material.dart';
import 'package:flutter_ui_examples/common/gen/assets.gen.dart';

class SneakyCategory {
  SneakyCategory(this.name, this.quantity, this.sneakyList);

  final String name;
  final int quantity;
  final List<Sneaky> sneakyList;
}

class Sneaky {
  Sneaky(
    this.image,
    this.name,
    this.description,
    this.price,
    this.colors,
    this.sizes,
  );

  final String image;
  final String name;
  final String description;
  final double price;
  final List<Color> colors;
  final List<SneakySize> sizes;
}

class SneakySize {
  SneakySize(this.size, {this.isAvailable = false});

  final int size;
  final bool isAvailable;
}

const description = "A remarkable shoe that's naturally soft, cozy all over, "
    'and fits your every move.\n Lorem ipsum dolor sit amet, consectetur '
    'adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore '
    'magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco '
    'laboris nisi ut aliquip ex ea';

final _sneakyList = <Sneaky>[
  Sneaky(
    Assets.images.sneaky.blackSneaky.path,
    'Men casual runners',
    description,
    96.99,
    <Color>[
      Colors.black,
      Colors.red,
      Colors.lightBlue,
      Colors.yellowAccent,
      Colors.green,
    ],
    <SneakySize>[
      SneakySize(8, isAvailable: true),
      SneakySize(9, isAvailable: true),
      SneakySize(10),
      SneakySize(11, isAvailable: true),
      SneakySize(12, isAvailable: true),
    ],
  ),
  Sneaky(
    Assets.images.sneaky.blueSneaky.path,
    'Women casual runners',
    description,
    98.99,
    <Color>[
      Colors.black,
      Colors.red,
      Colors.lightBlue,
      Colors.yellowAccent,
      Colors.green,
    ],
    <SneakySize>[
      SneakySize(6),
      SneakySize(7, isAvailable: true),
      SneakySize(8, isAvailable: true),
      SneakySize(9, isAvailable: true),
      SneakySize(10, isAvailable: true),
    ],
  ),
  Sneaky(
    Assets.images.sneaky.redSneaky.path,
    'Child casual runners',
    description,
    89.99,
    <Color>[
      Colors.black,
      Colors.red,
      Colors.lightBlue,
      Colors.yellowAccent,
      Colors.green,
    ],
    <SneakySize>[
      SneakySize(3, isAvailable: true),
      SneakySize(4, isAvailable: true),
      SneakySize(5),
      SneakySize(6, isAvailable: true),
    ],
  ),
  Sneaky(
    Assets.images.sneaky.yellowSneaky.path,
    'Unisex casual runners',
    description,
    100.99,
    <Color>[
      Colors.black,
      Colors.red,
      Colors.lightBlue,
      Colors.yellowAccent,
      Colors.green,
    ],
    <SneakySize>[
      SneakySize(8, isAvailable: true),
      SneakySize(9, isAvailable: true),
      SneakySize(10, isAvailable: true),
      SneakySize(11, isAvailable: true),
      SneakySize(12),
    ],
  ),
];

final sneakyCategories = <SneakyCategory>[
  SneakyCategory('Casual', 80, _sneakyList),
  SneakyCategory('Sporty', 30, _sneakyList),
];
