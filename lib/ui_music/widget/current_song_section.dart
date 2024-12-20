part of '../music_ui.dart';

class _CurrentSongSection extends HookWidget {
  const _CurrentSongSection({required this.music, required this.percent});

  final MusicModel music;
  final double percent;

  @override
  Widget build(BuildContext context) {
    final currentPercent = useValueNotifier(percent);

    return Column(
      children: <Widget>[
        Center(
          child: SizedBox.fromSize(
            size: const Size(250, 250),
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: const Color(0xFF4B9AD5).withValues(alpha: .5),
                shape: BoxShape.circle,
              ),
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: CircularSeekBar(
                  width: double.infinity,
                  height: double.infinity,
                  progressColor: const Color(0xFF4B9AD5),
                  trackColor: Colors.blue.withValues(alpha: .5),
                  barWidth: 5,
                  progress: currentPercent.value,
                  innerThumbRadius: 10,
                  innerThumbColor: const Color(0xFF4B9AD5),
                  valueNotifier: currentPercent,
                  child: Center(
                    child: SizedBox.fromSize(
                      size: const Size(200, 200),
                      child: Padding(
                        padding: const EdgeInsets.all(3),
                        child: ClipOval(
                          clipper: MyClipper(),
                          child: Image.asset(music.image, fit: BoxFit.cover),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        const Gap(15),
        Column(
          children: <Widget>[
            Text(
              music.artist,
              style: GoogleFonts.mulish(
                color: const Color(0xFF4B9AD5),
                fontSize: 20,
              ),
            ),
            Text(
              music.song,
              style: GoogleFonts.mulish(
                color: const Color(0xFF4B9AD5).withValues(alpha: .5),
                fontSize: 18,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
