import 'package:circular_seek_bar/circular_seek_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_ui_examples/common/responsive.dart';
import 'package:flutter_ui_examples/ui_music/model/music_model.dart';
import 'package:flutter_ui_examples/ui_music/widget/my_clipper.dart';
import 'package:google_fonts/google_fonts.dart';

class CurrentSongSection extends HookWidget {
  const CurrentSongSection({
    required this.music,
    required this.percent,
    super.key,
  });

  final MusicModel music;
  final double percent;

  @override
  Widget build(BuildContext context) {
    final currentPercent = useValueNotifier(percent);

    return Column(
      children: <Widget>[
        Center(
          child: SizedBox(
            width: Responsive().setWidth(250),
            height: Responsive().setHeight(250),
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: const Color(0xFF4B9AD5).withOpacity(.5),
                shape: BoxShape.circle,
              ),
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: CircularSeekBar(
                  width: double.infinity,
                  height: double.infinity,
                  progressColor: const Color(0xFF4B9AD5),
                  trackColor: Colors.blue.withOpacity(.5),
                  barWidth: 5,
                  progress: currentPercent.value,
                  innerThumbRadius: 10,
                  innerThumbColor: const Color(0xFF4B9AD5),
                  valueNotifier: currentPercent,
                  child: Center(
                    child: SizedBox(
                      height: Responsive().setHeight(200),
                      width: Responsive().setWidth(200),
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
        SizedBox(height: Responsive().setHeight(15)),
        Column(
          children: <Widget>[
            Text(
              music.artist,
              style: GoogleFonts.mulish(
                color: const Color(0xFF4B9AD5),
                fontSize: Responsive().setSp(20),
              ),
            ),
            Text(
              music.song,
              style: GoogleFonts.mulish(
                color: const Color(0xFF4B9AD5).withOpacity(.5),
                fontSize: Responsive().setSp(18),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
