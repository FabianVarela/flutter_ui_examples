class StreamingModel {
  StreamingModel(this.image, this.title);

  final String image;
  final String title;
}

final streamingList = <StreamingModel>[
  StreamingModel(
    'assets/images/streaming/fullMetalAlchemist.jpg',
    'Fullmetal alchemist: Brotherhood',
  ),
  StreamingModel('assets/images/streaming/daredevil.jpg', 'Daredevil'),
  StreamingModel(
    'assets/images/streaming/avengers.jpeg',
    'Avengers: Infinity war',
  ),
  StreamingModel(
    'assets/images/streaming/batman.jpg',
    'Batman: The dark knight',
  ),
  StreamingModel('assets/images/streaming/onePunchMan.png', 'One punch man'),
  StreamingModel('assets/images/streaming/breakingBad.jpg', 'Breaking bad'),
  StreamingModel('assets/images/streaming/dark.jpg', 'Dark'),
];
