import 'package:flutter/material.dart';
import 'package:flutter_ui_examples/common/gen/assets.gen.dart';

class PageModel {
  PageModel({
    required this.imageUrl,
    required this.title,
    required this.body,
    required this.titleGradient,
  });

  final String imageUrl;
  final String title;
  final String body;
  final List<Color> titleGradient;
}

List<PageModel> pageList = <PageModel>[
  PageModel(
    imageUrl: Assets.images.onboarding.illustration.path,
    title: 'MUSIC',
    body: 'EXPERIENCE WICKED PLAYLISTS',
    titleGradient: <Color>[const Color(0xFF9708CC), const Color(0xFF43CBBF)],
  ),
  PageModel(
    imageUrl: Assets.images.onboarding.illustration2.path,
    title: 'YOGA',
    body: 'FEEL THE MAGIC OF THE WELLNESS',
    titleGradient: <Color>[const Color(0xFFE2859F), const Color(0xFFFCCF31)],
  ),
  PageModel(
    imageUrl: Assets.images.onboarding.illustration3.path,
    title: 'TRAVEL',
    body: "LET'S WAKE UP AND KNOW THE WORLD",
    titleGradient: <Color>[const Color(0xFF5EFCE8), const Color(0xFF736EFE)],
  ),
];
