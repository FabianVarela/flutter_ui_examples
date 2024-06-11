import 'package:flutter_ui_examples/common/gen/assets.gen.dart';

class MusicModel {
  MusicModel(this.image, this.song, this.artist, {this.isCurrent = false});

  final String image;
  final String song;
  final String artist;
  final bool isCurrent;
}

final musics = <MusicModel>[
  MusicModel(
    Assets.images.music.metallica.path,
    'The unforgiven',
    'Metallica',
  ),
  MusicModel(
    Assets.images.music.gunsNroses.path,
    'Stranged',
    'Guns n roses',
    isCurrent: true,
  ),
  MusicModel(
    Assets.images.music.fooFighters.path,
    'Walk',
    'Foo fighters',
  ),
  MusicModel(
    Assets.images.music.bonJovi.path,
    "Livin' On A Prayer",
    'Bon Jovi',
  ),
  MusicModel(
    Assets.images.music.metallica.path,
    'Fuel',
    'Metallica',
  ),
  MusicModel(
    Assets.images.music.fooFighters.path,
    'Everlong',
    'Foo fighters',
  ),
];
