import 'package:flutter/material.dart';
import 'package:flutter_ui_examples/streaming/my_clipper.dart';

class HomeScreenTopPart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 420,
      child: Stack(
        children: <Widget>[
          ClipPath(
            clipper: MyClipper(),
            child: Container(
              height: 370,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    offset: Offset(0, 10),
                    blurRadius: 10,
                  )
                ],
              ),
              child: Stack(
                children: <Widget>[
                  Image.asset(
                    "assets/images/fullMetalAlchemist.jpg",
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: double.infinity,
                  ),
                  Container(
                    height: double.infinity,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color(0x00000000),
                          Color(0xD9333333),
                        ],
                        stops: [0.0, 0.9],
                        begin: FractionalOffset(0.0, 0.0),
                        end: FractionalOffset(0.0, 1.0),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(top: 120, left: 95),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "WATCH BEFORE EVERYONE",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontFamily: "Muli",
                            ),
                          ),
                          Text(
                            "Fullmetal alchemist: Brotherhood",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 40,
                              fontFamily: "Muli",
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 370,
            right: -20,
            child: FractionalTranslation(
              translation: Offset(0.0, -0.5),
              child: Row(
                children: <Widget>[
                  FloatingActionButton(
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.add,
                      color: Color(0xFFE52020),
                    ),
                    onPressed: () {},
                  ),
                  SizedBox(width: 12),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: RaisedButton(
                      color: Color(0xFFE52020),
                      padding: EdgeInsets.symmetric(
                        vertical: 15,
                        horizontal: 80,
                      ),
                      child: Row(
                        children: <Widget>[
                          Text(
                            "Watch now",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontFamily: "Milu",
                            ),
                          ),
                          SizedBox(width: 5),
                          RotatedBox(
                            quarterTurns: 2,
                            child: Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
