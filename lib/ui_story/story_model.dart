class StoryModel {
  final String image;
  final String name;

  StoryModel(this.image, this.name);
}

List<StoryModel> stories = <StoryModel>[
  StoryModel(
    'assets/images/image_01.png',
    'Jack the Persian and the Black Castel',
  ),
  StoryModel(
    'assets/images/image_02.jpg',
    'The Dreaming Moon',
  ),
  StoryModel(
    'assets/images/image_03.jpg',
    'Fallen In Love',
  ),
  StoryModel(
    'assets/images/image_04.jpg',
    'Hounted Ground',
  ),
];
