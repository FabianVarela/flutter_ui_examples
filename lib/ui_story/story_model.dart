class StoryModel {
  StoryModel(this.image, this.name);

  final String image;
  final String name;
}

List<StoryModel> stories = <StoryModel>[
  StoryModel(
    'assets/images/story/image_01.png',
    'Jack the Persian and the Black Castel',
  ),
  StoryModel(
    'assets/images/story/image_02.jpg',
    'The Dreaming Moon',
  ),
  StoryModel(
    'assets/images/story/image_03.jpg',
    'Fallen In Love',
  ),
  StoryModel(
    'assets/images/story/image_04.jpg',
    'Hounted Ground',
  ),
];
