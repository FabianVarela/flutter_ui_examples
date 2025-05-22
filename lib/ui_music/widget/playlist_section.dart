part of '../music_ui.dart';

class _PlaylistSection extends StatelessWidget {
  const _PlaylistSection({required this.musicList});

  final List<MusicModel> musicList;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox.fromSize(
        size: const Size(double.infinity, 250),
        child: Stack(
          children: <Widget>[
            const _PaintedPositioned(position: _PaintedPosition.left),
            const _PaintedPositioned(position: _PaintedPosition.right),
            Center(
              child: ListView.builder(
                itemCount: musicList.length,
                itemBuilder: (_, index) {
                  return _PlayListItem(music: musicList[index], index: index);
                },
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
              width: 40,
              height: 40,
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

enum _PaintedPosition { left, right }

class _PaintedPositioned extends StatelessWidget {
  const _PaintedPositioned({required this.position});

  final _PaintedPosition position;

  @override
  Widget build(BuildContext context) {
    final container = SizedBox.fromSize(
      size: const Size(50, 250),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: const Color(0xFF4B9AD5),
          borderRadius: position == _PaintedPosition.left
              ? const BorderRadius.only(
                  topRight: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                )
              : const BorderRadius.only(
                  topLeft: Radius.circular(30),
                  bottomLeft: Radius.circular(30),
                ),
        ),
      ),
    );

    return position == _PaintedPosition.left
        ? Positioned(left: -25, child: container)
        : Positioned(right: -25, child: container);
  }
}
