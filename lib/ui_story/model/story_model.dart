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
    image: 'assets/images/story/image_01.png',
    name: 'Jack the Persian and the Black Castel',
  ),
  StoryModel(
    image: 'assets/images/story/image_02.jpg',
    name: 'The Dreaming Moon',
    isFavorite: true,
  ),
  StoryModel(
    image: 'assets/images/story/image_03.jpg',
    name: 'Fallen In Love',
  ),
  StoryModel(
    image: 'assets/images/story/image_04.jpg',
    name: 'Hounted Ground',
  ),
];
