import 'package:flutter_ui_examples/common/gen/assets.gen.dart';

class MusicModel {
  MusicModel({
    required this.image,
    required this.song,
    required this.artist,
    this.isCurrent = false,
  });

  final String image;
  final String song;
  final String artist;
  final bool isCurrent;
}

final musics = <MusicModel>[
  MusicModel(
    image: Assets.images.music.metallica.path,
    song: 'The unforgiven',
    artist: 'Metallica',
  ),
  MusicModel(
    image: Assets.images.music.gunsNroses.path,
    song: 'Stranged',
    artist: 'Guns n roses',
    isCurrent: true,
  ),
  MusicModel(
    image: Assets.images.music.fooFighters.path,
    song: 'Walk',
    artist: 'Foo fighters',
  ),
  MusicModel(
    image: Assets.images.music.bonJovi.path,
    song: "Livin' On A Prayer",
    artist: 'Bon Jovi',
  ),
  MusicModel(
    image: Assets.images.music.metallica.path,
    song: 'Fuel',
    artist: 'Metallica',
  ),
  MusicModel(
    image: Assets.images.music.fooFighters.path,
    song: 'Everlong',
    artist: 'Foo fighters',
  ),
];
