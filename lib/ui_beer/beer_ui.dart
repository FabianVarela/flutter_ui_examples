import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_ui_examples/common/responsive.dart';
import 'package:flutter_ui_examples/ui_beer/model/beer_model.dart';
import 'package:flutter_ui_examples/ui_beer/widget/beer_bottle_item.dart';
import 'package:flutter_ui_examples/ui_beer/widget/beer_detail_item.dart';
import 'package:flutter_ui_examples/ui_beer/widget/my_clipper.dart';
import 'package:google_fonts/google_fonts.dart';

class BeerUI extends HookWidget {
  const BeerUI({required this.onPressedMenu, super.key});

  final VoidCallback onPressedMenu;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    final currentIndex = useState(0);
    final bottlePageController = usePageController(viewportFraction: .5);
    final detailPageController = usePageController();

    bottlePageController.addListener(() {
      detailPageController.animateToPage(
        currentIndex.value,
        duration: const Duration(milliseconds: 100),
        curve: Curves.ease,
      );
    });

    detailPageController.addListener(() {
      bottlePageController.animateToPage(
        currentIndex.value,
        duration: const Duration(milliseconds: 100),
        curve: Curves.ease,
      );
    });

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(Icons.menu, size: 32, color: Colors.black),
          onPressed: onPressedMenu,
        ),
        title: Text(
          'Welcome, Fabián',
          textAlign: TextAlign.center,
          style: GoogleFonts.montserrat(
            color: Colors.black,
            fontSize: Responsive().setSp(20),
            fontWeight: FontWeight.w300,
          ),
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: SizedBox.fromSize(
              size: const Size(36, 36),
              child: Image.asset(
                'assets/images/beer/profile.png',
                fit: BoxFit.contain,
              ),
            ),
          ),
        ],
      ),
      body: Stack(
        clipBehavior: Clip.none,
        children: <Widget>[
          ClipPath(
            clipper: MyClipper(),
            child: Container(
              width: Responsive().setWidth(width),
              height: Responsive().setHeight(height),
              decoration: BoxDecoration(
                color: beers[currentIndex.value].color,
                boxShadow: const <BoxShadow>[
                  BoxShadow(
                    color: Colors.black12,
                    offset: Offset(0, 10),
                    blurRadius: 10,
                  )
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 130, left: 40, right: 20),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Grab\nyour\nbeer.',
                      style: GoogleFonts.montserrat(
                        fontSize: Responsive().setSp(30),
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                        // beers[currentIndex.value].textColor,
                      ),
                    ),
                    // TODO(FV): Separate it
                    /*
                    Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: SizedBox.fromSize(
                        size: const Size(120, 60),
                        child: Image.asset(
                          beers[currentIndex.value].imageLogo,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    */
                  ],
                ),
              ),
            ),
          ),
          // TODO(FV): Clip path set a color transition
          // TODO(FV): Set small image with bottle image
          Positioned.fill(
            top: 150,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: PageView.builder(
                    itemCount: beers.length,
                    controller: bottlePageController,
                    onPageChanged: (index) => currentIndex.value = index,
                    itemBuilder: (_, index) => BeerBottleItem(
                      index: index,
                      beer: beers[index],
                      controller: bottlePageController,
                    ),
                  ),
                ),
                SizedBox(
                  height: 270,
                  child: PageView.builder(
                    itemCount: beers.length,
                    controller: detailPageController,
                    onPageChanged: (index) => currentIndex.value = index,
                    itemBuilder: (_, index) => BeerDetailItem(
                      beer: beers[index],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 50,
                    vertical: 30,
                  ),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(width, 50),
                      backgroundColor: Colors.blueAccent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () {},
                    child: Text(
                      'Grab',
                      style: GoogleFonts.montserrat(
                        fontSize: Responsive().setSp(18),
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}