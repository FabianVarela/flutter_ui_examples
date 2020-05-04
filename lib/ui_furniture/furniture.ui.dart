import 'package:flutter/material.dart';
import 'package:flutter_ui_examples/common/responsive.dart';
import 'package:flutter_ui_examples/ui_furniture/custom_icon.dart';
import 'package:flutter_ui_examples/ui_furniture/furniture_model.dart';

class FurnitureUI extends StatefulWidget {
  FurnitureUI({@required this.onPressedMenu});

  final Function onPressedMenu;

  @override
  _FurnitureUIState createState() => _FurnitureUIState();
}

class _FurnitureUIState extends State<FurnitureUI> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF2F3F8),
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          _buildGradientContainer(),
          _buildAppBar(),
          _buildTitle(),
          _buildList(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        fixedColor: Colors.black,
        onTap: (int index) => setState(() => _currentIndex = index),
        currentIndex: _currentIndex,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.panorama_horizontal), title: Container()),
          BottomNavigationBarItem(
              icon: Icon(Icons.bookmark_border), title: Container()),
        ],
      ),
      floatingActionButton: Container(
        width: Responsive().setHeight(65),
        height: Responsive().setWidth(65),
        decoration: BoxDecoration(
          color: Color(0x0FFA7B58),
          shape: BoxShape.circle,
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Color(0xFFF78A6C).withOpacity(.8),
              offset: Offset(0.0, 10),
              blurRadius: 10,
            )
          ],
        ),
        child: RawMaterialButton(
          onPressed: () {},
          shape: CircleBorder(),
          child: Icon(Icons.add, size: 35, color: Colors.white),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Widget _buildGradientContainer() {
    return Align(
      alignment: Alignment.topRight,
      child: Container(
        width: Responsive().setWidth(Responsive().width * .8),
        height: Responsive().setHeight(Responsive().height / 2),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: <Color>[
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
      top: Responsive().setHeight(30),
      left: Responsive().setWidth(20),
      right: Responsive().setWidth(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          IconButton(
            icon: Icon(CustomIcons.menu, color: Colors.black),
            onPressed: widget.onPressedMenu,
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

  Widget _buildTitle() {
    return Positioned(
      top: Responsive().setHeight(Responsive().height * .15),
      left: Responsive().setWidth(30),
      right: Responsive().setHeight(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Wooden Armchairs',
            style: TextStyle(
              fontSize: Responsive().setSp(20),
              fontFamily: 'MontserratBlack',
            ),
          ),
          Text(
            'Beautiful armchairs to decorate your home',
            style: TextStyle(
              fontSize: Responsive().setSp(16),
              fontFamily: 'MontserratMedium',
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildList() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: SizedBox(
        height: Responsive().setHeight(
          Responsive().height >= 750
              ? Responsive().height * .55
              : Responsive().height * .65,
        ),
        child: ListView.builder(
          itemCount: furnitureList.length,
          scrollDirection: Axis.horizontal,
          physics: BouncingScrollPhysics(),
          itemBuilder: (_, int index) =>
              _buildItem(furnitureList[index], index),
        ),
      ),
    );
  }

  Widget _buildItem(FurnitureModel furniture, int index) {
    return Padding(
      padding: EdgeInsets.only(
        left: Responsive().setWidth(35),
        bottom: Responsive().setHeight(50),
      ),
      child: SizedBox(
        width: Responsive().setWidth(200),
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: Responsive().setHeight(45)),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: (index % 2 == 0) ? Colors.white : Color(0xFF2A2D3F),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                      color: Colors.black12,
                      offset: Offset(0.0, 10),
                      blurRadius: 10,
                    ),
                  ],
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  furniture.image,
                  width: Responsive().setWidth(172),
                  height: Responsive().setHeight(199),
                ),
                SizedBox(height: Responsive().setHeight(12)),
                Padding(
                  padding: EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        furniture.title,
                        style: TextStyle(
                          fontSize: Responsive().setSp(16),
                          fontFamily: 'MontserratBlack',
                          color: (index % 2 == 0)
                              ? Color(0xFF2A2D3F)
                              : Colors.white,
                        ),
                      ),
                      SizedBox(height: Responsive().setHeight(7)),
                      Text(
                        'New Sell',
                        style: TextStyle(
                          fontSize: Responsive().setSp(12),
                          fontFamily: 'MontserratMedium',
                          color: (index % 2 == 0)
                              ? Color(0xFF2A2D3F)
                              : Colors.white,
                        ),
                      ),
                      SizedBox(height: Responsive().setHeight(45)),
                      Text(
                        '${furniture.price} \$',
                        style: TextStyle(
                          fontSize: Responsive().setSp(30),
                          fontFamily: 'MontserratBold',
                          color: (index % 2 == 0)
                              ? Color(0xFF2A2D3F)
                              : Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
