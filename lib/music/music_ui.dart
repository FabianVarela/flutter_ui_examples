import 'dart:math';

import 'package:flutter/material.dart';
import 'package:fluttery_seekbar/fluttery_seekbar.dart';

class MusicUI extends StatefulWidget {
  @override
  _MusicUIState createState() => _MusicUIState();
}

class _MusicUIState extends State<MusicUI> {
  var _color = Color(0xFF4B9AD5);
  double _thumbPercent = 0.4;

  Widget _buildRadialSeekBar() {
    return RadialSeekBar(
      trackColor: Colors.blue.withOpacity(.5),
      trackWidth: 2,
      progressColor: _color,
      progressWidth: 5,
      thumb: CircleThumb(
        color: _color,
        diameter: 20,
      ),
      thumbPercent: _thumbPercent,
      progress: _thumbPercent,
      onDragUpdate: (percent) {
        setState(() {
          _thumbPercent = percent;
        });
      },
    );
  }

  Widget _song(String image, String title, String subtitle) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            image,
            width: 40,
            height: 40,
          ),
          SizedBox(
            height: 8,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                title,
                style: TextStyle(
                  color: _color,
                ),
              ),
              Text(
                subtitle,
                style: TextStyle(
                  color: _color,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          color: _color,
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {},
        ),
        title: Text(
          "Music player",
          style: TextStyle(
            color: _color,
            fontFamily: "Muli",
          ),
        ),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.menu),
            color: _color,
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 30,
          ),
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
          SizedBox(
            height: 25,
          ),
          Column(
            children: <Widget>[
              Text(
                "Bon Jovi",
                style: TextStyle(
                  color: _color,
                  fontSize: 20,
                  fontFamily: "Muli",
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                "Livin' On A Prayer",
                style: TextStyle(
                  color: _color.withOpacity(.5),
                  fontSize: 18,
                  fontFamily: "MuliLight",
                ),
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
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
                      border: Border.all(
                        color: _color,
                        width: 3,
                      ),
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
                          Expanded(
                            child: Container(),
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
          SizedBox(
            height: 10,
          ),
          SingleChildScrollView(
            child: Container(
              height: 190,
              width: double.infinity,
              child: Stack(
                children: <Widget>[
                  Positioned(
                    left: -25,
                    child: Container(
                      width: 50,
                      height: 190,
                      decoration: BoxDecoration(
                        color: _color,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(30),
                          bottomRight: Radius.circular(30),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    right: -25,
                    child: Container(
                      width: 50,
                      height: 190,
                      decoration: BoxDecoration(
                        color: _color,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          bottomLeft: Radius.circular(30),
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        _song("", "", ""),
                        _song("", "", ""),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class MyClipper extends CustomClipper<Rect> {
  @override
  Rect getClip(Size size) {
    return Rect.fromCircle(
      center: Offset(
        size.width / 2,
        size.height / 2,
      ),
      radius: min(size.width, size.height) / 2,
    );
  }

  @override
  bool shouldReclip(CustomClipper<Rect> oldClipper) {
    return true;
  }
}
