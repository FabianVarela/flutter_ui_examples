import 'package:flutter/material.dart';
import 'package:flutter_ui_examples/common/gen/assets.gen.dart';

class PageModel {
  PageModel(this.imageUrl, this.title, this.body, this.titleGradient);

  final String imageUrl;
  final String title;
  final String body;
  final List<Color> titleGradient;
}

List<PageModel> pageList = <PageModel>[
  PageModel(
    Assets.images.onboarding.illustration.path,
    'MUSIC',
    'EXPERIENCE WICKED PLAYLISTS',
    <Color>[const Color(0xFF9708CC), const Color(0xFF43CBBF)],
  ),
  PageModel(
    Assets.images.onboarding.illustration2.path,
    'YOGA',
    'FEEL THE MAGIC OF THE WELLNESS',
    <Color>[const Color(0xFFE2859F), const Color(0xFFFCCF31)],
  ),
  PageModel(
    Assets.images.onboarding.illustration3.path,
    'TRAVEL',
    "LET'S WAKE UP AND KNOW THE WORLD",
    <Color>[const Color(0xFF5EFCE8), const Color(0xFF736EFE)],
  ),
];
