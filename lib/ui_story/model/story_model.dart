import 'package:flutter_ui_examples/common/gen/assets.gen.dart';

class StoryModel {
  StoryModel({
    required this.image,
    required this.name,
    this.isFavorite = false,
  });

  final String image;
  final String name;
  final bool isFavorite;
}

final stories = <StoryModel>[
  StoryModel(
    image: Assets.images.story.image01.path,
    name: 'Jack the Persian and the Black Castel',
  ),
  StoryModel(
    image: Assets.images.story.image02.path,
    name: 'The Dreaming Moon',
    isFavorite: true,
  ),
  StoryModel(
    image: Assets.images.story.image03.path,
    name: 'Fallen In Love',
  ),
  StoryModel(
    image: Assets.images.story.image04.path,
    name: 'Hounted Ground',
  ),
];
