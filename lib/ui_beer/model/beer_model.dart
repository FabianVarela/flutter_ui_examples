import 'package:flutter/material.dart';
import 'package:flutter_ui_examples/common/gen/assets.gen.dart';

class BeerModel {
  BeerModel({
    required this.name,
    required this.slogan,
    required this.description,
    required this.rating,
    required this.bottleImage,
    required this.backImage,
    required this.smallImage,
    required this.color,
    required this.textColor,
  });

  final String name;
  final String slogan;
  final String description;
  final double rating;
  final String bottleImage;
  final String backImage;
  final String smallImage;
  final Color color;
  final Color textColor;
}

final beers = <BeerModel>[
  BeerModel(
    name: 'Aguila Original',
    slogan: 'Colombian Pilsner & Pure Tradition',
    description:
        'Aguila Original, classic, tasty and refreshing lager beer than has '
        'been enjoyed for more than a century.',
    rating: 5,
    bottleImage: Assets.images.beer.aguila.path,
    backImage: Assets.images.beer.aguilaBackLogo.path,
    smallImage: Assets.images.beer.aguilaSmallLogo.path,
    color: const Color(0xFFF7DB4A),
    textColor: const Color(0xFF5B350E),
  ),
  BeerModel(
    name: 'Budweiser',
    slogan: 'King Of Beers',
    description:
        'Introduced by Adolphus Busch in 1876 and is still produced with the '
        'same care and high quality, extracting standards.',
    rating: 4.1,
    bottleImage: Assets.images.beer.budweiser.path,
    backImage: Assets.images.beer.budweiserBackLogo.path,
    smallImage: Assets.images.beer.budweiserSmallLogo.path,
    color: const Color(0xFFB73A32),
    textColor: const Color(0xFFFDF2EC),
  ),
  BeerModel(
    name: 'Club Colombia\nDorada',
    slogan: 'Colombian Lager & Pure Tradition',
    description:
        'Born in 1949 in Colombia with the name of Club Sixty, in '
        'commemoration of the sixty years of the Bavaria foundation.',
    rating: 3.9,
    bottleImage: Assets.images.beer.clubColombiaDorada.path,
    backImage: Assets.images.beer.clubColombiaBackLogo.path,
    smallImage: Assets.images.beer.clubColombiaSmallLogo.path,
    color: const Color(0xFFAB9352),
    textColor: const Color(0xFF3B2106),
  ),
  BeerModel(
    name: 'Club Colombia\nRoja',
    slogan: 'Colombian Lager & Pure Tradition',
    description:
        'Born in 1949 in Colombia with the name of Club Sixty, in '
        'commemoration of the sixty years of the Bavaria foundation.',
    rating: 3.5,
    bottleImage: Assets.images.beer.clubColombiaRoja.path,
    backImage: Assets.images.beer.clubColombiaBackLogo.path,
    smallImage: Assets.images.beer.clubColombiaSmallLogo.path,
    color: const Color(0xFF930F18),
    textColor: const Color(0xFFF1EBE7),
  ),
  BeerModel(
    name: 'Club Colombia\nNegra',
    slogan: 'Colombian Lager & Pure Tradition',
    description:
        'Born in 1949 in Colombia with the name of Club Sixty, in '
        'commemoration of the sixty years of the Bavaria foundation.',
    rating: 4.5,
    bottleImage: Assets.images.beer.clubColombiaNegra.path,
    backImage: Assets.images.beer.clubColombiaBackLogo.path,
    smallImage: Assets.images.beer.clubColombiaSmallLogo.path,
    color: const Color(0xFF4E4847),
    textColor: const Color(0xFFEFECE5),
  ),
  BeerModel(
    name: 'Club Colombia Trigo',
    slogan: 'Colombian Lager & Pure Tradition',
    description:
        'Born in 1949 in Colombia with the name of Club Sixty, in '
        'commemoration of the sixty years of the Bavaria foundation.',
    rating: 4.3,
    bottleImage: Assets.images.beer.clubColombiaTrigo.path,
    backImage: Assets.images.beer.clubColombiaBackLogo.path,
    smallImage: Assets.images.beer.clubColombiaSmallLogo.path,
    color: const Color(0xFFCBB2A4),
    textColor: const Color(0xFF532213),
  ),
  BeerModel(
    name: 'Stella Artois',
    slogan: 'The Original Belgium Lager',
    description:
        'Belgian pilsner of between 4.8 and 5.2 percent ABV which was first '
        'brewed by Brouwerij Artois.',
    rating: 5,
    bottleImage: Assets.images.beer.stellaArtois.path,
    backImage: Assets.images.beer.stellaArtoisBackLogo.path,
    smallImage: Assets.images.beer.stellaArtoisSmallLogo.path,
    color: const Color(0xFFE7E7E3),
    textColor: const Color(0xFF483931),
  ),
];
