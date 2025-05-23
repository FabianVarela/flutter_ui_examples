import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_ui_examples/common/gen/assets.gen.dart';
import 'package:flutter_ui_examples/ui_beer/model/beer_model.dart';
import 'package:flutter_ui_examples/ui_beer/widget/clipper/my_clipper.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

part 'widget/beer_bottle_item.dart';

part 'widget/beer_detail_item.dart';

part 'widget/beer_header.dart';

class BeerUI extends HookWidget {
  const BeerUI({required this.onPressedMenu, super.key});

  final VoidCallback onPressedMenu;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;

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
            fontSize: 20,
            fontWeight: FontWeight.w300,
          ),
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: SizedBox.fromSize(
              size: const Size(36, 36),
              child: Assets.images.beer.profile.image(fit: BoxFit.contain),
            ),
          ),
        ],
      ),
      body: Stack(
        clipBehavior: Clip.none,
        children: <Widget>[
          Hero(
            tag: '${beers[currentIndex.value].name}_tag',
            transitionOnUserGestures: true,
            child: BeerHeader(index: currentIndex.value),
          ),
          const SizedBox.expand(),
          Positioned.fill(
            top: 150,
            child: Column(
              children: <Widget>[
                Expanded(
                  child: PageView.builder(
                    itemCount: beers.length,
                    controller: bottlePageController,
                    onPageChanged: (index) => currentIndex.value = index,
                    itemBuilder: (_, index) => BeerBottleItem(
                      beer: beers[index],
                      pageController: bottlePageController,
                      index: index,
                    ),
                  ),
                ),
                SizedBox(
                  height: 250,
                  child: PageView.builder(
                    itemCount: beers.length,
                    controller: detailPageController,
                    onPageChanged: (index) => currentIndex.value = index,
                    itemBuilder: (_, index) {
                      return BeerDetailItem(beer: beers[index]);
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(50, 10, 50, 30),
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
                        fontSize: 18,
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
