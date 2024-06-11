import 'package:flutter_ui_examples/common/gen/assets.gen.dart';

class StreamingModel {
  StreamingModel(this.image, this.title);

  final String image;
  final String title;
}

final streamingList = <StreamingModel>[
  StreamingModel(
    Assets.images.streaming.jujutsu.path,
    'Jujutsu Kaisen',
  ),
  StreamingModel(
    Assets.images.streaming.mandalorian.path,
    'The Mandalorian',
  ),
  StreamingModel(
    Assets.images.streaming.succession.path,
    'Succession',
  ),
  StreamingModel(
    Assets.images.streaming.theBear.path,
    'The bear',
  ),
  StreamingModel(
    Assets.images.streaming.fullMetalAlchemist.path,
    'Fullmetal alchemist: Brotherhood',
  ),
  StreamingModel(
    Assets.images.streaming.daredevil.path,
    'Daredevil',
  ),
  StreamingModel(
    Assets.images.streaming.avengers.path,
    'Avengers: Infinity war',
  ),
  StreamingModel(
    Assets.images.streaming.batman.path,
    'Batman: The dark knight',
  ),
  StreamingModel(
    Assets.images.streaming.onePunchMan.path,
    'One punch man',
  ),
  StreamingModel(
    Assets.images.streaming.breakingBad.path,
    'Breaking bad',
  ),
  StreamingModel(
    Assets.images.streaming.dark.path,
    'Dark',
  ),
];
