import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_ui_examples/common/responsive.dart';
import 'package:flutter_ui_examples/ui_beer/beer_model.dart';
import 'package:flutter_ui_examples/ui_beer/my_clipper.dart';
import 'package:google_fonts/google_fonts.dart';

class BeerUI extends StatefulWidget {
  BeerUI({@required this.onPressedMenu});

  final Function onPressedMenu;

  @override
  _BeerUIState createState() => _BeerUIState();
}

class _BeerUIState extends State<BeerUI> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Stack(
            children: <Widget>[
              ClipPath(
                clipper: MyClipper(),
                child: _setHeader(),
              ),
              Container(
                height: Responsive().setHeight(
                  MediaQuery.of(context).size.height,
                ),
              ),
              Positioned.fill(
                top: 30,
                child: _setBeerPage(),
              ),
              Positioned(
                bottom: 40,
                left: 40,
                right: 40,
                child: _setGrabButton(),
              ),
            ],
          ),
          _buildAppBar(),
        ],
      ),
    );
  }

  Widget _setHeader() {
    return Container(
      height: Responsive().setHeight(MediaQuery.of(context).size.height * 0.5),
      width: Responsive().setWidth(MediaQuery.of(context).size.width),
      decoration: BoxDecoration(
        color: beers[_currentIndex].color,
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black12,
            offset: Offset(0, 10),
            blurRadius: 10,
          )
        ],
      ),
      child: Padding(
        padding: EdgeInsets.only(top: 130, left: 40),
        child: Text(
          'Grab\nyour\nbeer.',
          style: GoogleFonts.montserrat(
              fontSize: 30,
              fontWeight: FontWeight.w500,
              color: beers[_currentIndex].textColor),
        ),
      ),
    );
  }

  Widget _setBeerPage() {
    return PageView.builder(
      itemCount: beers.length,
      onPageChanged: (int index) {
        setState(() => _currentIndex = index);
      },
      itemBuilder: (_, int index) {
        final BeerModel item = beers[index];
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              item.bottleLogo,
              height: 400,
              fit: BoxFit.fitHeight,
            ),
            Padding(
              padding: EdgeInsets.only(top: 20, bottom: 5),
              child: Text(
                item.name,
                style: GoogleFonts.montserrat(
                  fontSize: 35,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 5),
              child: Text(
                item.slogan,
                style: GoogleFonts.montserrat(fontSize: 14),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 5, bottom: 10),
              child: RatingBar(
                initialRating: item.rating,
                onRatingUpdate: null,
                itemBuilder: (_, __) => Icon(
                  Icons.star,
                  color: Colors.yellow,
                ),
                allowHalfRating: true,
                itemSize: 22,
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(30, 10, 30, 20),
              child: Text(
                item.description,
                textAlign: TextAlign.center,
                style: GoogleFonts.montserrat(
                  fontSize: 18,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _setGrabButton() {
    return RaisedButton(
      onPressed: () {},
      color: Colors.blueAccent,
      padding: EdgeInsets.symmetric(vertical: 15),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        'Grab',
        style: GoogleFonts.montserrat(
          fontSize: 18,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget _buildAppBar() {
    return SafeArea(
      bottom: true,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              icon: Icon(
                Icons.menu,
                size: 32,
                color: Colors.white,
              ),
              onPressed: widget.onPressedMenu,
            ),
            Expanded(
              child: Text(
                'Welcome, Fabián',
                textAlign: TextAlign.center,
                style: GoogleFonts.montserrat(
                  color: Colors.white,
                  fontSize: Responsive().setSp(20),
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Container(
                height: 36,
                width: 36,
                decoration: BoxDecoration(
                    image: DecorationImage(
                  image: AssetImage('assets/images/beer/profile.png'),
                  fit: BoxFit.contain,
                )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
