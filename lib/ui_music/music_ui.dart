import 'package:circular_seek_bar/circular_seek_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_ui_examples/ui_music/model/music_model.dart';
import 'package:flutter_ui_examples/ui_music/widget/my_clipper.dart';
import 'package:google_fonts/google_fonts.dart';

part 'widget/control_section.dart';

part 'widget/current_song_section.dart';

part 'widget/playlist_section.dart';

class MusicUI extends HookWidget {
  const MusicUI({required this.onPressedMenu, super.key});

  final VoidCallback onPressedMenu;

  @override
  Widget build(BuildContext context) {
    final thumbPercent = useState<double>(20);
    final currentMusic = musics.firstWhere(
      (music) => music.isCurrent,
      orElse: () => musics.first,
    );

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          color: const Color(0xFF4B9AD5),
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {},
        ),
        title: Text(
          'Music player',
          style: GoogleFonts.mulish(color: const Color(0xFF4B9AD5)),
        ),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.menu),
            color: const Color(0xFF4B9AD5),
            onPressed: onPressedMenu,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const SizedBox(height: 30),
            CurrentSongSection(
              music: currentMusic,
              percent: thumbPercent.value,
            ),
            const SizedBox(height: 20),
            const ControlSection(),
            const SizedBox(height: 20),
            PlaylistSection(musicList: musics),
          ],
        ),
      ),
    );
  }
}
