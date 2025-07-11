import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_ui_examples/common/gen/assets.gen.dart';
import 'package:flutter_ui_examples/ui_furniture/model/furniture_model.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vector_graphics/vector_graphics.dart';

part 'widget/custom_title.dart';

part 'widget/furniture_item.dart';

part 'widget/gradient_container.dart';

class FurnitureUI extends HookWidget {
  const FurnitureUI({required this.onPressedMenu, super.key});

  final VoidCallback onPressedMenu;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final currentIndex = useState(0);

    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: const Color(0xFFF2F3F8),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: IconButton(
            icon: VectorGraphic(
              loader: AssetBytesLoader(Assets.svg.furniture.menu),
              colorFilter: const ColorFilter.mode(
                Colors.black,
                BlendMode.srcIn,
              ),
            ),
            onPressed: onPressedMenu,
          ),
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: IconButton(
              icon: VectorGraphic(
                loader: AssetBytesLoader(Assets.svg.furniture.search),
                colorFilter: const ColorFilter.mode(
                  Colors.black,
                  BlendMode.srcIn,
                ),
              ),
              onPressed: () {},
            ),
          ),
        ],
      ),
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          const _GradientContainer(),
          Positioned(
            top: height * .15,
            left: 30,
            right: 20,
            child: const _CustomTitle(
              title: 'Wooden Armchairs',
              subtitle: 'Beautiful armchairs to decorate your home',
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: SizedBox(
              height: height >= 750 ? height * .55 : height * .65,
              child: ListView.builder(
                itemCount: furnitureList.length,
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (_, index) => _FurnitureItem(
                  image: furnitureList[index].image,
                  title: furnitureList[index].title,
                  price: furnitureList[index].price,
                  currentIndex: index,
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: NavigationBar(
        indicatorColor: Colors.black12,
        selectedIndex: currentIndex.value,
        backgroundColor: const Color(0xFFFBFCFD),
        onDestinationSelected: (index) => currentIndex.value = index,
        labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
        destinations: const <NavigationDestination>[
          NavigationDestination(
            selectedIcon: Icon(Icons.panorama_horizontal_select_rounded),
            icon: Icon(Icons.panorama_horizontal_rounded),
            label: '',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.bookmark_outlined),
            icon: Icon(Icons.bookmark_border_outlined),
            label: '',
          ),
        ],
      ),
      floatingActionButton: TextButton(
        clipBehavior: Clip.none,
        style: TextButton.styleFrom(
          overlayColor: Colors.black,
          minimumSize: const Size(65, 65),
          shape: const CircleBorder(),
          backgroundBuilder: (_, _, child) => DecoratedBox(
            decoration: BoxDecoration(
              color: const Color(0x0FFA7B58),
              shape: BoxShape.circle,
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color: const Color(0xFFF78A6C).withValues(alpha: .8),
                  blurRadius: 10,
                ),
              ],
            ),
            child: child,
          ),
        ),
        onPressed: () {},
        child: const Icon(Icons.add, size: 35, color: Colors.white),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
