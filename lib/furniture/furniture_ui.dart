import 'package:flutter/material.dart';
import 'package:flutter_ui_examples/common/custom_drawer.dart';
import 'package:flutter_ui_examples/furniture/card_item.dart';
import 'package:flutter_ui_examples/furniture/custom_icon.dart';
import 'package:flutter_ui_examples/furniture/data.dart';

class FurnitureUI extends StatefulWidget {
  @override
  _FurnitureUIState createState() => _FurnitureUIState();
}

class _FurnitureUIState extends State<FurnitureUI> {
  int _currentIndex = 0;

  Widget _buildGradientContainer(double width, double height) {
    return Align(
      alignment: Alignment.topRight,
      child: Container(
        width: width * .8,
        height: height / 2,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFFFBFCFD),
              Color(0xFFF2F3F8),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
      ),
    );
  }

  Widget _buildAppBar() {
    return Positioned(
      top: 40,
      left: 20,
      right: 20,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Builder(
            builder: (context) => IconButton(
                  icon: Icon(CustomIcons.menu, color: Colors.black),
                  onPressed: () => Scaffold.of(context).openDrawer(),
                ),
          ),
          IconButton(
            icon: Icon(
              CustomIcons.search,
              color: Colors.black,
            ),
            onPressed: () {},
          )
        ],
      ),
    );
  }

  Widget _buildTitle(double height) {
    return Positioned(
      top: height * .2,
      left: 30,
      right: 20,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Wooden Armchairs",
            style: TextStyle(
              fontSize: 20,
              fontFamily: "MontserratBlack",
            ),
          ),
          Text(
            "Beautiful armchairs to decorate your home",
            style: TextStyle(
              fontSize: 16,
              fontFamily: "MontserratMedium",
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF2F3F8),
      drawer: CustomDrawer(),
      body: LayoutBuilder(builder: (context, constraints) {
        var width = constraints.maxWidth;
        var height = constraints.maxHeight;

        print("width $width");
        print("height $height");

        return Stack(
          fit: StackFit.expand,
          children: <Widget>[
            _buildGradientContainer(width, height),
            _buildAppBar(),
            _buildTitle(height),
            Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                height: (height > 600) ? height * .6 : height * .68,
                child: ListView.builder(
                    itemCount: images.length,
                    scrollDirection: Axis.horizontal,
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return CardItem(
                        height,
                        index,
                        images[index],
                        titles[index],
                        prices[index],
                      );
                    }),
              ),
            ),
          ],
        );
      }),
      bottomNavigationBar: BottomNavigationBar(
          fixedColor: Colors.black,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          currentIndex: _currentIndex,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.panorama_horizontal),
              title: Container(
                height: 0,
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.bookmark_border),
              title: Container(
                height: 0,
              ),
            ),
          ]),
      floatingActionButton: Container(
        width: 65,
        height: 65,
        decoration: BoxDecoration(
            color: Color(0xFFA7B58),
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Color(0xFFF78A6C).withOpacity(.8),
                offset: Offset(0.0, 10.0),
                blurRadius: 10.0,
              )
            ]),
        child: RawMaterialButton(
          onPressed: () {},
          shape: CircleBorder(),
          child: Icon(
            Icons.add,
            size: 35,
            color: Colors.white,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
