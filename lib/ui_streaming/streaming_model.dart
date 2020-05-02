class StreamingModel {
  final String image;
  final String title;

  StreamingModel(this.image, this.title);
}

List<StreamingModel> streamingList = <StreamingModel>[
  StreamingModel('assets/images/fullMetalAlchemist.jpg',
      'Fullmetal alchemist: Brotherhood'),
  StreamingModel('assets/images/daredevil.jpg', 'Daredevil'),
  StreamingModel('assets/images/avengers.jpeg', 'Avengers: Infinity war'),
  StreamingModel('assets/images/batman.jpg', 'Batman: The dark knight'),
  StreamingModel('assets/images/onePunchMan.png', 'One punch man'),
  StreamingModel('assets/images/breakingBad.jpg', 'Breaking bad'),
  StreamingModel('assets/images/dark.jpg', 'Dark'),
];
