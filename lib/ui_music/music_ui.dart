import 'package:flutter/material.dart';
import 'package:flutter_ui_examples/common/responsive.dart';
import 'package:flutter_ui_examples/ui_music/model/music_model.dart';
import 'package:flutter_ui_examples/ui_music/widget/control_section.dart';
import 'package:flutter_ui_examples/ui_music/widget/current_song_section.dart';
import 'package:flutter_ui_examples/ui_music/widget/playlist_section.dart';
import 'package:google_fonts/google_fonts.dart';

class MusicUI extends StatefulWidget {
  const MusicUI({required this.onPressedMenu, super.key});

  final VoidCallback onPressedMenu;

  @override
  _MusicUIState createState() => _MusicUIState();
}

class _MusicUIState extends State<MusicUI> {
  final double _thumbPercent = 20;

  @override
  Widget build(BuildContext context) {
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
            onPressed: widget.onPressedMenu,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(height: Responsive().setHeight(30)),
            CurrentSongSection(music: musics[1], percent: _thumbPercent),
            SizedBox(height: Responsive().setHeight(20)),
            const ControlSection(),
            SizedBox(height: Responsive().setHeight(20)),
            PlaylistSection(musicList: musics),
          ],
        ),
      ),
    );
  }
}
