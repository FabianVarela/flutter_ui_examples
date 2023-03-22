import 'package:flutter/material.dart';

class PageModel {
  PageModel(this.imageUrl, this.title, this.body, this.titleGradient);

  final String imageUrl;
  final String title;
  final String body;
  final List<Color> titleGradient;
}

List<PageModel> pageList = <PageModel>[
  PageModel(
    'assets/images/onboarding/illustration.png',
    'MUSIC',
    'EXPERIENCE WICKED PLAYLISTS',
    <Color>[const Color(0xFF9708CC), const Color(0xFF43CBBF)],
  ),
  PageModel(
    'assets/images/onboarding/illustration2.png',
    'YOGA',
    'FEEL THE MAGIC OF THE WELLNESS',
    <Color>[const Color(0xFFE2859F), const Color(0xFFFCCF31)],
  ),
  PageModel(
    'assets/images/onboarding/illustration3.png',
    'TRAVEL',
    "LET'S WAKE UP AND KNOW THE WORLD",
    <Color>[const Color(0xFF5EFCE8), const Color(0xFF736EFE)],
  ),
];
