import 'package:flutter/material.dart';

class BeerModel {
  BeerModel({
    required this.name,
    required this.slogan,
    required this.description,
    required this.rating,
    required this.imageLogo,
    required this.bottleLogo,
    required this.color,
    required this.textColor,
  });

  final String name;
  final String slogan;
  final String description;
  final double rating;
  final String imageLogo;
  final String bottleLogo;
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
    imageLogo: 'assets/images/beer/aguila_logo.png',
    bottleLogo: 'assets/images/beer/aguila.png',
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
    imageLogo: 'assets/images/beer/budweiser_logo.png',
    bottleLogo: 'assets/images/beer/budweiser.png',
    color: const Color(0xFFB73A32),
    textColor: const Color(0xFFFDF2EC),
  ),
  BeerModel(
    name: 'Club Colombia\nDorada',
    slogan: 'Colombian Lager & Pure Tradition',
    description: 'Born in 1949 in Colombia with the name of Club Sixty, in '
        'commemoration of the sixty years of the Bavaria foundation.',
    rating: 3.9,
    imageLogo: 'assets/images/beer/club_colombia_logo.png',
    bottleLogo: 'assets/images/beer/club_colombia_dorada.png',
    color: const Color(0xFFAB9352),
    textColor: const Color(0xFF3B2106),
  ),
  BeerModel(
    name: 'Club Colombia\nRoja',
    slogan: 'Colombian Lager & Pure Tradition',
    description: 'Born in 1949 in Colombia with the name of Club Sixty, in '
        'commemoration of the sixty years of the Bavaria foundation.',
    rating: 3.5,
    imageLogo: 'assets/images/beer/club_colombia_logo.png',
    bottleLogo: 'assets/images/beer/club_colombia_roja.png',
    color: const Color(0xFF930F18),
    textColor: const Color(0xFFF1EBE7),
  ),
  BeerModel(
    name: 'Club Colombia\nNegra',
    slogan: 'Colombian Lager & Pure Tradition',
    description: 'Born in 1949 in Colombia with the name of Club Sixty, in '
        'commemoration of the sixty years of the Bavaria foundation.',
    rating: 4.5,
    imageLogo: 'assets/images/beer/club_colombia_logo.png',
    bottleLogo: 'assets/images/beer/club_colombia_negra.png',
    color: const Color(0xFF4E4847),
    textColor: const Color(0xFFEFECE5),
  ),
  BeerModel(
    name: 'Club Colombia Trigo',
    slogan: 'Colombian Lager & Pure Tradition',
    description: 'Born in 1949 in Colombia with the name of Club Sixty, in '
        'commemoration of the sixty years of the Bavaria foundation.',
    rating: 4.3,
    imageLogo: 'assets/images/beer/club_colombia_logo.png',
    bottleLogo: 'assets/images/beer/club_colombia_trigo.png',
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
    imageLogo: 'assets/images/beer/stella_artois_logo.png',
    bottleLogo: 'assets/images/beer/stella_artois.png',
    color: const Color(0xFFE7E7E3),
    textColor: const Color(0xFF483931),
  ),
];
