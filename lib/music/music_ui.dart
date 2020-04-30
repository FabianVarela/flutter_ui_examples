import 'package:flutter/material.dart';
import 'package:flutter_ui_examples/common/custom_drawer.dart';
import 'package:flutter_ui_examples/music/radial/custom_radial_seek.dart';
import 'package:flutter_ui_examples/music/my_clipper.dart';

class MusicUI extends StatefulWidget {
  @override
  _MusicUIState createState() => _MusicUIState();
}

class _MusicUIState extends State<MusicUI> {
  var _color = Color(0xFF4B9AD5);
  double _thumbPercent = 0.4;

  Widget _buildRadialSeekBar() {
    return CustomRadialSeek(
      width: 2,
      color: Colors.blue.withOpacity(.5),
      progressColor: _color,
      progressWidth: 5,
      thumbPercent: _thumbPercent,
      progress: _thumbPercent,
      onDragUpdate: (double percent) => setState(() => _thumbPercent = percent),
      thumb: CircleThumb(color: _color, diameter: 20),
    );
  }

  Widget _customSongText(
      String text, Color color, double size, bool isOpacity) {
    return Text(
      text,
      style: TextStyle(
        color: isOpacity ? color.withOpacity(.5) : color,
        fontSize: size,
        fontFamily: "Muli",
      ),
    );
  }

  Widget _customItemText(String text, Color color) =>
      Text(text, style: TextStyle(color: color));

  Widget _customHeightSizedBox(double height) => SizedBox(height: height);

  Widget _customWidthSizedBox(double width) => SizedBox(width: width);

  Widget _song(String image, String title, String subtitle) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(image, width: 40, height: 40),
          _customWidthSizedBox(8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _customItemText(title, _color),
              _customItemText(subtitle, _color),
            ],
          ),
        ],
      ),
    );
  }

  Widget _customPositioned(bool isLeft) {
    var borderRadius = isLeft
        ? BorderRadius.only(
            topRight: Radius.circular(30),
            bottomRight: Radius.circular(30),
          )
        : BorderRadius.only(
            topLeft: Radius.circular(30),
            bottomLeft: Radius.circular(30),
          );

    var container = Container(
      width: 50,
      height: 190,
      decoration: BoxDecoration(
        color: _color,
        borderRadius: borderRadius,
      ),
    );

    return isLeft
        ? Positioned(left: -25, child: container)
        : Positioned(right: -25, child: container);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: CustomDrawer(),
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          color: _color,
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {},
        ),
        title: Text(
          "Music player",
          style: TextStyle(color: _color, fontFamily: "Muli"),
        ),
        centerTitle: true,
        actions: <Widget>[
          Builder(
            builder: (context) => IconButton(
              icon: Icon(Icons.menu),
              color: _color,
              onPressed: () => Scaffold.of(context).openDrawer(),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            _customHeightSizedBox(30),
            Center(
              child: Container(
                height: 250,
                width: 250,
                child: Stack(
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        color: _color.withOpacity(.5),
                        shape: BoxShape.circle,
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(12),
                        child: _buildRadialSeekBar(),
                      ),
                    ),
                    Center(
                      child: Container(
                        height: 200,
                        width: 200,
                        child: Padding(
                          padding: EdgeInsets.all(3),
                          child: ClipOval(
                            clipper: MyClipper(),
                            child: Image.asset(
                              "assets/images/bonJovi.jpg",
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
            _customHeightSizedBox(25),
            Column(
              children: <Widget>[
                _customSongText("Bon Jovi", _color, 20, false),
                _customHeightSizedBox(8),
                _customSongText("Livin' On A Prayer", _color, 18, true)
              ],
            ),
            _customHeightSizedBox(10),
            Container(
              width: 350,
              height: 150,
              child: Stack(
                children: <Widget>[
                  Center(
                    child: Container(
                      height: 65,
                      width: 290,
                      decoration: BoxDecoration(
                        border: Border.all(color: _color, width: 3),
                        borderRadius: BorderRadius.circular(40),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 25),
                        child: Row(
                          children: <Widget>[
                            Icon(
                              Icons.fast_rewind,
                              size: 55,
                              color: _color,
                            ),
                            Expanded(child: Container()),
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
                      width: 92,
                      height: 92,
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
            ),
            _customHeightSizedBox(10),
            SingleChildScrollView(
              child: Container(
                height: 190,
                width: double.infinity,
                child: Stack(
                  children: <Widget>[
                    _customPositioned(true),
                    _customPositioned(false),
                    Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          _song("assets/images/metallica.jpg", "The unforgiven",
                              "Metallica"),
                          _song("assets/images/gunsNroses.jpeg", "Stranged",
                              "Guns n roses"),
                          _song("assets/images/fooFighters.jpg", "Walk",
                              "Foo fighters"),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
