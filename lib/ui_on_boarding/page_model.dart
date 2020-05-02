import 'package:flutter/material.dart';

class PageModel {
  String imageUrl;

  String title;
  String body;
  List<Color> titleGradient = <Color>[];

  PageModel({
    this.imageUrl,
    this.title,
    this.body,
    this.titleGradient,
  });
}

List<PageModel> pageList = <PageModel>[
  PageModel(
    imageUrl: 'assets/images/illustration.png',
    title: 'MUSIC',
    body: 'EXPERIENCE WICKED PLAYLISTS',
    titleGradient: <Color>[Color(0xFF9708CC), Color(0xFF43CBBF)],
  ),
  PageModel(
    imageUrl: 'assets/images/illustration2.png',
    title: 'YOGA',
    body: 'FEEL THE MAGIC OF THE WELLNESS',
    titleGradient: <Color>[Color(0xFFE2859F), Color(0xFFFCCF31)],
  ),
  PageModel(
    imageUrl: 'assets/images/illustration3.png',
    title: 'TRAVEL',
    body: 'LET\'S WAKE UP AND KNOW THE WORLD',
    titleGradient: <Color>[Color(0xFF5EFCE8), Color(0xFF736EFE)],
  ),
];
