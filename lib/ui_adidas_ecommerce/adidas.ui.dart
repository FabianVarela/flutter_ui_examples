import 'package:flutter/material.dart';
import 'package:flutter_ui_examples/common/responsive.dart';
import 'package:flutter_ui_examples/ui_adidas_ecommerce/data.dart';
import 'package:flutter_ui_examples/ui_adidas_ecommerce/my_clipper.dart';
import 'package:google_fonts/google_fonts.dart';

class AdidasUI extends StatefulWidget {
  AdidasUI({@required this.onPressedMenu});

  final Function onPressedMenu;

  @override
  _AdidasUIState createState() => _AdidasUIState();
}

class _AdidasUIState extends State<AdidasUI> {
  bool _isExpanded = false;

  int _currentSizeIndex = 0;
  int _quantityValue = 0;
  int _currentColorIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: <Color>[
            Color(0xFF696D77),
            Color(0xFF292C36),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          tileMode: TileMode.clamp,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: _buildAppBar(),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              _buildTopSection(),
              _buildProductSection(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      leading: IconButton(
        icon: Icon(
          Icons.menu,
          size: 25,
        ),
        onPressed: widget.onPressedMenu,
      ),
      title: Text(
        'Energy Cloud',
        style: GoogleFonts.montserrat(
          color: Colors.white,
          fontSize: Responsive().setSp(20),
          fontWeight: FontWeight.w900,
        ),
      ),
      centerTitle: true,
      actions: <Widget>[
        IconButton(
          icon: Icon(
            Icons.favorite_border,
            size: 25,
            color: Colors.white,
          ),
          onPressed: () {},
        ),
      ],
    );
  }

  /// Top Section

  Widget _buildTopSection() {
    return Container(
      width: double.infinity,
      height: Responsive().setHeight(300),
      child: Stack(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                child: Image.asset(
                  'assets/images/adidas/adidas.png',
                  width: double.infinity,
                  height: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: Responsive().setHeight(60),
                  right: Responsive().setWidth(35),
                ),
                child: Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    width: Responsive().setWidth(50),
                    height: Responsive().setHeight(50),
                    decoration: BoxDecoration(
                      color: Colors.black26,
                      shape: BoxShape.circle,
                    ),
                    child: Image.asset('assets/images/adidas/360.png'),
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            left: Responsive().setWidth(18),
            bottom: Responsive().setHeight(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(bottom: Responsive().setHeight(8)),
                  child: Text(
                    'Rating',
                    style: GoogleFonts.montserrat(
                      color: Color(0xFF949598),
                      fontSize: Responsive().setSp(14),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Row(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      child: Icon(Icons.star, color: Color(0xFFFFE600)),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 8),
                      child: Text(
                        '4.5',
                        style: TextStyle(
                          color: Color(0xFFFFE600),
                          fontSize: Responsive().setSp(16),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 8),
                      child: Text(
                        '(478 people)',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: Responsive().setSp(16),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Product Section

  Widget _buildProductSection() {
    return Container(
      padding: EdgeInsets.only(top: Responsive().setHeight(10)),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _productTitle(),
          _productDescription(),
          _buildButtonLessMore(),
          _quantityTitle(),
          _quantitySection(),
          _selectColorTitle(),
          _buildColorListSection(),
          _priceTitle(),
          _buildPriceSection(),
        ],
      ),
    );
  }

  Widget _productTitle() {
    return Padding(
      padding: EdgeInsets.only(
        left: Responsive().setWidth(18),
        bottom: Responsive().setHeight(8),
      ),
      child: Text(
        'Product Description',
        style: TextStyle(
          color: Color(0xFF949598),
          fontSize: Responsive().setSp(14),
          fontFamily: 'MontserratSemibold',
        ),
      ),
    );
  }

  Widget _productDescription() {
    return Padding(
      padding: EdgeInsets.only(
        left: Responsive().setWidth(26),
        right: Responsive().setWidth(18),
      ),
      child: AnimatedCrossFade(
        firstChild: Text(
          productDescription,
          maxLines: 2,
          style: GoogleFonts.montserrat(
            color: Colors.white,
            fontSize: Responsive().setSp(14),
            fontWeight: FontWeight.w500,
          ),
        ),
        secondChild: Text(
          productDescription,
          style: GoogleFonts.montserrat(
            color: Colors.white,
            fontSize: Responsive().setSp(14),
            fontWeight: FontWeight.w500,
          ),
        ),
        crossFadeState:
            _isExpanded ? CrossFadeState.showSecond : CrossFadeState.showFirst,
        duration: kThemeAnimationDuration,
      ),
    );
  }

  Widget _buildButtonLessMore() {
    return Padding(
      padding: EdgeInsets.only(
        left: Responsive().setWidth(26),
        right: Responsive().setWidth(18),
        bottom: Responsive().setHeight(12),
      ),
      child: GestureDetector(
        child: Text(
          _isExpanded ? 'less' : 'more...',
          style: TextStyle(
            color: Color(0xFFFB382F),
            fontWeight: FontWeight.w700,
          ),
        ),
        onTap: () => setState(() => _isExpanded = !_isExpanded),
      ),
    );
  }

  Widget _quantityTitle() {
    return Padding(
      padding: EdgeInsets.only(
        left: Responsive().setWidth(15),
        right: Responsive().setWidth(65),
        bottom: Responsive().setHeight(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            'Size',
            style: GoogleFonts.montserrat(
              color: Color(0xFF949598),
              fontSize: Responsive().setSp(14),
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            'Quantity',
            style: GoogleFonts.montserrat(
              color: Color(0xFF949598),
              fontSize: Responsive().setSp(14),
              fontWeight: FontWeight.w500,
            ),
          )
        ],
      ),
    );
  }

  Widget _quantitySection() {
    return Padding(
      padding: EdgeInsets.only(
        left: Responsive().setWidth(10),
        right: Responsive().setWidth(5),
        bottom: Responsive().setHeight(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          _buildSizeSection(),
          _buildQuantitySection(),
        ],
      ),
    );
  }

  Widget _buildSizeSection() {
    return Container(
      height: Responsive().setHeight(38),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: List<Widget>.generate(sizeNumList.length, (int index) {
          return GestureDetector(
            onTap: () => setState(() => _currentSizeIndex = index),
            child: Padding(
              padding: EdgeInsets.only(left: Responsive().setWidth(12)),
              child: Container(
                width: Responsive().setWidth(40),
                height: Responsive().setHeight(40),
                decoration: BoxDecoration(
                  color: index == _currentSizeIndex
                      ? Color(0xFFFC3930)
                      : Color(0xFF525663),
                  borderRadius: BorderRadius.circular(5),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                      color: index == _currentSizeIndex
                          ? Colors.black.withOpacity(.5)
                          : Colors.black12,
                      offset: Offset(0, 10),
                      blurRadius: 10,
                    )
                  ],
                ),
                child: Center(
                  child: Text(
                    sizeNumList[index],
                    style: GoogleFonts.montserrat(
                      color: Colors.white,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }

  Widget _buildQuantitySection() {
    return Padding(
      padding: EdgeInsets.all(12),
      child: Container(
        width: Responsive().setWidth(120),
        height: Responsive().setHeight(40),
        decoration: BoxDecoration(
          color: Color(0xFF525663),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Flexible(
              flex: 3,
              child: GestureDetector(
                onTap: () => setState(() {
                  if (_quantityValue > 0) {
                    _quantityValue--;
                  }
                }),
                child: Text(
                  '-',
                  style: GoogleFonts.montserrat(
                    color: Colors.white,
                    fontSize: Responsive().setSp(24),
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
            ),
            _divider(),
            Flexible(
              flex: 3,
              child: Text(
                '$_quantityValue',
                style: GoogleFonts.montserrat(
                  color: Colors.white,
                  fontSize: Responsive().setSp(22),
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
            _divider(),
            Flexible(
              flex: 3,
              child: GestureDetector(
                onTap: () => setState(() => _quantityValue++),
                child: Text(
                  '+',
                  style: GoogleFonts.montserrat(
                    color: Colors.white,
                    fontSize: Responsive().setSp(24),
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _divider() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 4),
      child: Container(width: 0.8, color: Colors.black),
    );
  }

  Widget _selectColorTitle() {
    return Padding(
      padding: EdgeInsets.only(
        left: Responsive().setWidth(18),
        bottom: Responsive().setHeight(10),
      ),
      child: Text(
        'Select Color',
        style: GoogleFonts.montserrat(
          color: Color(0xFF949598),
          fontSize: Responsive().setSp(14),
          fontWeight: FontWeight.w900,
        ),
      ),
    );
  }

  Widget _buildColorListSection() {
    return Container(
      width: double.infinity,
      height: Responsive().setHeight(34),
      margin: EdgeInsets.only(
        left: Responsive().setWidth(20),
        bottom: Responsive().setHeight(20),
      ),
      child: Row(
        children: List<Widget>.generate(colors.length, (int index) {
          return GestureDetector(
            onTap: () => setState(() => _currentColorIndex = index),
            child: Padding(
              padding: EdgeInsets.only(left: Responsive().setWidth(10)),
              child: Container(
                width: Responsive().setWidth(30),
                height: Responsive().setHeight(30),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(5),
                  boxShadow: index == _currentColorIndex
                      ? <BoxShadow>[
                          BoxShadow(
                            color: Colors.black.withOpacity(.8),
                            blurRadius: 10,
                            offset: Offset(0, 10),
                          )
                        ]
                      : <BoxShadow>[],
                ),
                child: ClipPath(
                  clipper: MyClipper(),
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    color: colors[index],
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }

  Widget _priceTitle() {
    return Padding(
      padding: EdgeInsets.only(
        left: Responsive().setWidth(20),
        bottom: Responsive().setHeight(10),
      ),
      child: Text(
        'Price',
        style: GoogleFonts.montserrat(
          color: Color(0xFF949598),
          fontWeight: FontWeight.w900,
        ),
      ),
    );
  }

  Widget _buildPriceSection() {
    return Container(
      width: double.infinity,
      height: Responsive().setHeight(120),
      child: Stack(
        alignment: Alignment.topCenter,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(left: Responsive().setWidth(22)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(
                    left: Responsive().setWidth(18),
                    bottom: Responsive().setHeight(10),
                  ),
                  child: Row(
                    children: <Widget>[
                      Text(
                        '\$',
                        style: GoogleFonts.montserrat(
                          color: Colors.white,
                          fontSize: Responsive().setSp(26),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        '80',
                        style: GoogleFonts.montserrat(
                          color: Colors.white,
                          fontSize: Responsive().setSp(35),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: RaisedButton(
                    onPressed: () {},
                    color: Color(0xFFFB382F),
                    padding: EdgeInsets.symmetric(
                      vertical: Responsive().setHeight(14),
                      horizontal: Responsive().setWidth(35),
                    ),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Add to cart',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: Responsive().setSp(15),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            right: -40,
            bottom: -45,
            child: Image.asset(
              'assets/images/adidas/cart.png',
              width: Responsive().setWidth(190),
              height: Responsive().setHeight(155),
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
