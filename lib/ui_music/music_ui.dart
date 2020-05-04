import 'package:flutter/material.dart';
import 'package:flutter_ui_examples/common/responsive.dart';
import 'package:flutter_ui_examples/ui_music/music_model.dart';
import 'package:flutter_ui_examples/ui_music/my_clipper.dart';
import 'package:flutter_ui_examples/ui_music/radial/custom_radial_seek.dart';

class MusicUI extends StatefulWidget {
  MusicUI({@required this.onPressedMenu});

  final Function onPressedMenu;

  @override
  _MusicUIState createState() => _MusicUIState();
}

class _MusicUIState extends State<MusicUI> {
  final Color _color = Color(0xFF4B9AD5);
  final int _currentSong = 1;

  double _thumbPercent = 0.4;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _setAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            _customHeightSizedBox(30),
            _setCurrentSong(),
            _customHeightSizedBox(20),
            _setControl(),
            _customHeightSizedBox(20),
            _setPlaylist(),
          ],
        ),
      ),
    );
  }

  Widget _customHeightSizedBox(double height) =>
      SizedBox(height: Responsive().setHeight(height));

  Widget _setAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      leading: IconButton(
        color: _color,
        icon: Icon(Icons.arrow_back_ios),
        onPressed: () {},
      ),
      title: Text(
        'Music player',
        style: TextStyle(color: _color, fontFamily: 'Muli'),
      ),
      centerTitle: true,
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.menu),
          color: _color,
          onPressed: widget.onPressedMenu,
        ),
      ],
    );
  }

  Widget _setCurrentSong() {
    return Column(
      children: <Widget>[
        Center(
          child: Container(
            height: Responsive().setHeight(250),
            width: Responsive().setWidth(250),
            child: Stack(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    color: _color.withOpacity(.5),
                    shape: BoxShape.circle,
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(12),
                    child: CustomRadialSeek(
                      width: 2,
                      color: Colors.blue.withOpacity(.5),
                      progressColor: _color,
                      progressWidth: 5,
                      thumbPercent: _thumbPercent,
                      progress: _thumbPercent,
                      onDragUpdate: (double percent) =>
                          setState(() => _thumbPercent = percent),
                      thumb: CircleThumb(color: _color, diameter: 20),
                    ),
                  ),
                ),
                Center(
                  child: Container(
                    height: Responsive().setHeight(200),
                    width: Responsive().setWidth(200),
                    child: Padding(
                      padding: EdgeInsets.all(3),
                      child: ClipOval(
                        clipper: MyClipper(),
                        child: Image.asset(
                          musics[_currentSong].image,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        _customHeightSizedBox(15),
        Column(
          children: <Widget>[
            Text(
              musics[_currentSong].artist,
              style: TextStyle(
                color: _color,
                fontSize: Responsive().setSp(20),
                fontFamily: 'Muli',
              ),
            ),
            Text(
              musics[_currentSong].song,
              style: TextStyle(
                color: _color.withOpacity(.5),
                fontSize: Responsive().setSp(18),
                fontFamily: 'Muli',
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _setControl() {
    return Container(
      width: Responsive().setWidth(350),
      height: Responsive().setHeight(110),
      child: Stack(
        children: <Widget>[
          Center(
            child: Container(
              height: Responsive().setHeight(65),
              width: Responsive().setWidth(290),
              decoration: BoxDecoration(
                border: Border.all(color: _color, width: 3),
                borderRadius: BorderRadius.circular(40),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: Responsive().setWidth(25),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Icon(
                      Icons.fast_rewind,
                      size: 55,
                      color: _color,
                    ),
                    Icon(
                      Icons.fast_forward,
                      size: 55,
                      color: _color,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Container(
              width: Responsive().setWidth(92),
              height: Responsive().setHeight(92),
              decoration: BoxDecoration(
                color: _color,
                shape: BoxShape.circle,
              ),
              child: IconButton(
                icon: Icon(
                  Icons.play_arrow,
                  size: 45,
                  color: Colors.white,
                ),
                onPressed: () {},
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _setPlaylist() {
    return SingleChildScrollView(
      child: Container(
        height: Responsive().setHeight(250),
        width: double.infinity,
        child: Stack(
          children: <Widget>[
            _customPositioned(true),
            _customPositioned(false),
            Center(
              child: ListView.builder(
                itemCount: musics.length,
                itemBuilder: (_, int index) {
                  return Padding(
                    padding: EdgeInsets.all(8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Expanded(
                          child: Image.asset(
                            musics[index].image,
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
                                musics[index].artist,
                                style: TextStyle(
                                  color: _color,
                                  fontWeight: _currentSong == index
                                      ? FontWeight.w700
                                      : FontWeight.w400,
                                ),
                              ),
                              Text(
                                musics[index].song,
                                style: TextStyle(
                                  color: _color,
                                  fontWeight: _currentSong == index
                                      ? FontWeight.w700
                                      : FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _customPositioned(bool isLeft) {
    final Widget container = Container(
      width: Responsive().setWidth(50),
      height: Responsive().setHeight(250),
      decoration: BoxDecoration(
        color: _color,
        borderRadius: isLeft
            ? BorderRadius.only(
                topRight: Radius.circular(30),
                bottomRight: Radius.circular(30),
              )
            : BorderRadius.only(
                topLeft: Radius.circular(30),
                bottomLeft: Radius.circular(30),
              ),
      ),
    );

    final double positionValue = Responsive().setWidth(-25);
    return isLeft
        ? Positioned(left: positionValue, child: container)
        : Positioned(right: positionValue, child: container);
  }
}
