import 'package:flutter_ui_examples/common/gen/assets.gen.dart';

class StreamingModel {
  StreamingModel({required this.image, required this.title});

  final String image;
  final String title;
}

final streamingList = <StreamingModel>[
  StreamingModel(
    image: Assets.images.streaming.jujutsu.path,
    title: 'Jujutsu Kaisen',
  ),
  StreamingModel(
    image: Assets.images.streaming.mandalorian.path,
    title: 'The Mandalorian',
  ),
  StreamingModel(
    image: Assets.images.streaming.succession.path,
    title: 'Succession',
  ),
  StreamingModel(
    image: Assets.images.streaming.theBear.path,
    title: 'The bear',
  ),
  StreamingModel(
    image: Assets.images.streaming.fullMetalAlchemist.path,
    title: 'Fullmetal alchemist: Brotherhood',
  ),
  StreamingModel(
    image: Assets.images.streaming.daredevil.path,
    title: 'Daredevil',
  ),
  StreamingModel(
    image: Assets.images.streaming.avengers.path,
    title: 'Avengers: Infinity war',
  ),
  StreamingModel(
    image: Assets.images.streaming.batman.path,
    title: 'Batman: The dark knight',
  ),
  StreamingModel(
    image: Assets.images.streaming.onePunchMan.path,
    title: 'One punch man',
  ),
  StreamingModel(
    image: Assets.images.streaming.breakingBad.path,
    title: 'Breaking bad',
  ),
  StreamingModel(
    image: Assets.images.streaming.dark.path,
    title: 'Dark',
  ),
];
