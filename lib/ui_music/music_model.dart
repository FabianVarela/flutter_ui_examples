class MusicModel {
  final String image;
  final String song;
  final String artist;

  MusicModel(this.image, this.song, this.artist);
}

List<MusicModel> musics = <MusicModel>[
  MusicModel(
    'assets/images/music/metallica.jpg',
    'The unforgiven',
    'Metallica',
  ),
  MusicModel(
    'assets/images/music/gunsNroses.jpeg',
    'Stranged',
    'Guns n roses',
  ),
  MusicModel(
    'assets/images/music/fooFighters.jpg',
    'Walk',
    'Foo fighters',
  ),
  MusicModel(
    'assets/images/music/bonJovi.jpg',
    'Livin\' On A Prayer',
    'Bon Jovi',
  ),
  MusicModel(
    'assets/images/music/metallica.jpg',
    'Fuel',
    'Metallica',
  ),
  MusicModel(
    'assets/images/music/fooFighters.jpg',
    'Everlong',
    'Foo fighters',
  ),
];
