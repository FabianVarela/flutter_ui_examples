import 'package:flutter/material.dart';

class PageModel {
  final String imageUrl;
  final String title;
  final String body;
  final List<Color> titleGradient;

  PageModel(this.imageUrl, this.title, this.body, this.titleGradient);
}

List<PageModel> pageList = <PageModel>[
  PageModel(
    'assets/images/illustration.png',
    'MUSIC',
    'EXPERIENCE WICKED PLAYLISTS',
    <Color>[Color(0xFF9708CC), Color(0xFF43CBBF)],
  ),
  PageModel(
    'assets/images/illustration2.png',
    'YOGA',
    'FEEL THE MAGIC OF THE WELLNESS',
    <Color>[Color(0xFFE2859F), Color(0xFFFCCF31)],
  ),
  PageModel(
    'assets/images/illustration3.png',
    'TRAVEL',
    'LET\'S WAKE UP AND KNOW THE WORLD',
    <Color>[Color(0xFF5EFCE8), Color(0xFF736EFE)],
  ),
];
