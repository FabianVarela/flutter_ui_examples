class MusicModel {
  final String image;
  final String song;
  final String artist;

  MusicModel(this.image, this.song, this.artist);
}

List<MusicModel> musics = <MusicModel>[
  MusicModel(
    'assets/images/metallica.jpg',
    'The unforgiven',
    'Metallica',
  ),
  MusicModel(
    'assets/images/gunsNroses.jpeg',
    'Stranged',
    'Guns n roses',
  ),
  MusicModel(
    'assets/images/fooFighters.jpg',
    'Walk',
    'Foo fighters',
  ),
  MusicModel(
    'assets/images/bonJovi.jpg',
    'Livin\' On A Prayer',
    'Bon Jovi',
  ),
  MusicModel(
    'assets/images/metallica.jpg',
    'Fuel',
    'Metallica',
  ),
  MusicModel(
    'assets/images/fooFighters.jpg',
    'Everlong',
    'Foo fighters',
  ),
];
