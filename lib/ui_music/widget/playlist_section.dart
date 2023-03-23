import 'package:flutter/material.dart';
import 'package:flutter_ui_examples/common/responsive.dart';
import 'package:flutter_ui_examples/ui_music/model/music_model.dart';
import 'package:google_fonts/google_fonts.dart';

class PlaylistSection extends StatelessWidget {
  const PlaylistSection({required this.musicList, super.key});

  final List<MusicModel> musicList;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        width: double.infinity,
        height: Responsive().setHeight(250),
        child: Stack(
          children: <Widget>[
            const _PaintedPositioned(isLeft: true),
            const _PaintedPositioned(isLeft: false),
            Center(
              child: ListView.builder(
                itemCount: musicList.length,
                itemBuilder: (_, index) => _PlayListItem(
                  music: musicList[index],
                  index: index,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _PlayListItem extends StatelessWidget {
  const _PlayListItem({required this.music, this.index = 0});

  final MusicModel music;
  final int index;

  @override
  Widget build(BuildContext context) {
    final fontWeight = music.isCurrent ? FontWeight.w700 : FontWeight.w400;

    return Padding(
      padding: const EdgeInsets.all(8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: Image.asset(
              music.image,
              fit: BoxFit.contain,
              width: Responsive().setWidth(40),
              height: Responsive().setHeight(40),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  music.artist,
                  style: GoogleFonts.mulish(
                    color: const Color(0xFF4B9AD5),
                    fontWeight: fontWeight,
                  ),
                ),
                Text(
                  music.song,
                  style: GoogleFonts.mulish(
                    color: const Color(0xFF4B9AD5),
                    fontWeight: fontWeight,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _PaintedPositioned extends StatelessWidget {
  const _PaintedPositioned({required this.isLeft});

  final bool isLeft;

  @override
  Widget build(BuildContext context) {
    final container = Container(
      width: Responsive().setWidth(50),
      height: Responsive().setHeight(250),
      decoration: BoxDecoration(
        color: const Color(0xFF4B9AD5),
        borderRadius: isLeft
            ? const BorderRadius.only(
                topRight: Radius.circular(30),
                bottomRight: Radius.circular(30),
              )
            : const BorderRadius.only(
                topLeft: Radius.circular(30),
                bottomLeft: Radius.circular(30),
              ),
      ),
    );

    final positionValue = Responsive().setWidth(-25);
    return isLeft
        ? Positioned(left: positionValue, child: container)
        : Positioned(right: positionValue, child: container);
  }
}
