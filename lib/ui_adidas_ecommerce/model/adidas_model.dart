import 'package:flutter/material.dart';
import 'package:flutter_ui_examples/common/gen/assets.gen.dart';

class AdidasModel {
  AdidasModel({
    required this.title,
    required this.image,
    required this.rating,
    required this.description,
    required this.sizes,
    required this.colors,
    required this.price,
  });

  final String title;
  final String image;
  final AdidasRating rating;
  final String description;
  final List<int> sizes;
  final List<Color> colors;
  final double price;
}

class AdidasRating {
  AdidasRating({required this.value, required this.voted});

  final double value;
  final int voted;
}

final adidasModel = AdidasModel(
  title: 'Energy Cloud',
  image: Assets.images.adidas.adidas.path,
  rating: AdidasRating(value: 4.5, voted: 478),
  description:
      'Get maximum support, comfort and a refreshed look with these adidas '
      'energy cloud shoes for men comes wit a classic style. '
      'Boost your running comfort to the next level with this supportive shoe '
      'Synthetic upper with FITFRAME midfoot cage for a locked-down fit '
      'and feel. Lace-up closure Cushioned footbed CLOUDFOAM midsole provides '
      'responsive padding Durable ADIWEAR™ rubber sole.',
  sizes: <int>[7, 8, 9, 10],
  colors: <Color>[
    const Color(0xFFF9362E),
    const Color(0xFF003CFF),
    const Color(0xFFFFB73A),
    const Color(0xFF3AFFFF),
    const Color(0xFF1AD12C),
    const Color(0xFFD66400),
  ],
  price: 80,
);
