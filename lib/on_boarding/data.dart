import 'package:flutter/material.dart';

var pageList = [
  PageModel(
    imageUrl: "assets/images/illustration.png",
    title: "MUSIC",
    body: "EXPERIENCE WICKED PLAYLISTS",
    titleGradient: gradients[0],
  ),
  PageModel(
    imageUrl: "assets/images/illustration2.png",
    title: "YOGA",
    body: "FEEL THE MAGIC OF THE WELLNESS",
    titleGradient: gradients[1],
  ),
  PageModel(
    imageUrl: "assets/images/illustration3.png",
    title: "TRAVEL",
    body: "LET'S WAKE UP AND KNOW THE WORLD",
    titleGradient: gradients[2],
  ),
];

List<List<Color>> gradients = [
  [Color(0xFF9708CC), Color(0xFF43CBBF)],
  [Color(0xFFE2859F), Color(0xFFFCCF31)],
  [Color(0xFF5EFCE8), Color(0xFF736EFE)],
];

class PageModel {
  String imageUrl;

  String title;
  String body;
  List<Color> titleGradient = [];

  PageModel({
    this.imageUrl,
    this.title,
    this.body,
    this.titleGradient,
  });
}
