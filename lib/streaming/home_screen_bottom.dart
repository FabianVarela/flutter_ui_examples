import 'package:flutter/material.dart';

class HomeScreenBottomPart extends StatelessWidget {
  List<String> images = [
    "assets/images/daredevil.jpg",
    "assets/images/avengers.jpeg",
    "assets/images/batman.jpg",
    "assets/images/onePunchMan.png",
  ];

  List<String> titles = [
    "Daredevil",
    "Avengers: Infinity war",
    "Batman: The dark knight",
    "One punch man",
  ];

  List<Widget> _movies() {
    List<Widget> movieList = List();

    for (int i = 0; i < images.length; i++) {
      var item = Padding(
        padding: EdgeInsets.symmetric(
          vertical: 25,
          horizontal: 12,
        ),
        child: Container(
          height: 220,
          width: 135,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 10,
                offset: Offset(0, 10),
              )
            ],
          ),
          child: Column(
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                child: Image.asset(
                  images[i],
                  width: double.infinity,
                  height: 130,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 4, left: 8, right: 8),
                child: Text(
                  titles[i],
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, fontFamily: "Milu"),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 3),
                child: Text(i == 0 ? "Season 2" : ""),
              ),
            ],
          ),
        ),
      );

      movieList.add(item);
    }

    return movieList;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 360,
      margin: EdgeInsets.only(left: 65),
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Watch now",
                  style: TextStyle(
                    fontSize: 22,
                    fontFamily: "Milu",
                  ),
                ),
                FlatButton(
                  child: Text("View more"),
                  onPressed: () {},
                )
              ],
            ),
          ),
          Container(
            height: 250,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: _movies(),
            ),
          ),
        ],
      ),
    );
  }
}
