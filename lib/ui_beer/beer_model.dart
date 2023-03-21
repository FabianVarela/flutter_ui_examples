import 'package:flutter/material.dart';

class BeerModel {
  final String name;
  final String slogan;
  final String description;
  final double rating;
  final String imageLogo;
  final String bottleLogo;
  final Color color;
  final Color textColor;

  BeerModel(
    this.name,
    this.slogan,
    this.description,
    this.rating,
    this.imageLogo,
    this.bottleLogo,
    this.color,
    this.textColor,
  );
}

List<BeerModel> beers = <BeerModel>[
  BeerModel(
    'Aguila Original',
    'Colombian Pilsner & Pure Tradition',
    'Aguila Original, classic, tasty and refreshing lager beer than has been enjoyed for more than a century.',
    5,
    'assets/images/beer/aguila_logo.png',
    'assets/images/beer/aguila.png',
    Colors.transparent,
    Colors.transparent,
  ),
  BeerModel(
    'Budweiser',
    'King Of Beers',
    'Introduced by Adolphus Busch in 1876 and is still produced with the same care and high quality, extracting standards.',
    4.1,
    'assets/images/beer/budweiser_logo.png',
    'assets/images/beer/budweiser.png',
    Colors.transparent,
    Colors.transparent,
  ),
  BeerModel(
    'Club Colombia Dorada',
    'Colombian Lager & Pure Tradition',
    'Born in 1949 in Colombia with the name of Club Sixty, in commemoration of the sixty years of the Bavaria foundation.',
    3.9,
    'assets/images/beer/club_colombia_logo.png',
    'assets/images/beer/club_colombia_dorada.png',
    Colors.transparent,
    Colors.transparent,
  ),
  BeerModel(
    'Club Colombia Roja',
    'Colombian Lager & Pure Tradition',
    'Born in 1949 in Colombia with the name of Club Sixty, in commemoration of the sixty years of the Bavaria foundation.',
    3.5,
    'assets/images/beer/club_colombia_logo.png',
    'assets/images/beer/club_colombia_roja.png',
    Colors.transparent,
    Colors.transparent,
  ),
  BeerModel(
    'Club Colombia Negra',
    'Colombian Lager & Pure Tradition',
    'Born in 1949 in Colombia with the name of Club Sixty, in commemoration of the sixty years of the Bavaria foundation.',
    4.5,
    'assets/images/beer/club_colombia_logo.png',
    'assets/images/beer/club_colombia_negra.png',
    Colors.transparent,
    Colors.transparent,
  ),
  BeerModel(
    'Club Colombia Trigo',
    'Colombian Lager & Pure Tradition',
    'Born in 1949 in Colombia with the name of Club Sixty, in commemoration of the sixty years of the Bavaria foundation.',
    4.3,
    'assets/images/beer/club_colombia_logo.png',
    'assets/images/beer/club_colombia_trigo.png',
    Colors.transparent,
    Colors.transparent,
  ),
  BeerModel(
    'Stella Artois',
    'The Original Belgium Lager',
    'Belgian pilsner of between 4.8 and 5.2 percent ABV which was first brewed by Brouwerij Artois.',
    5,
    'assets/images/beer/stella_artois_logo.png',
    'assets/images/beer/stella_artois.png',
    Colors.transparent,
    Colors.transparent,
  ),
];
