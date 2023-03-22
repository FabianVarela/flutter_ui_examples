import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_ui_examples/common/responsive.dart';
import 'package:flutter_ui_examples/ui_furniture/model/furniture_model.dart';
import 'package:flutter_ui_examples/ui_furniture/widget/custom_icon.dart';
import 'package:flutter_ui_examples/ui_furniture/widget/custom_title.dart';
import 'package:flutter_ui_examples/ui_furniture/widget/furniture_item.dart';
import 'package:flutter_ui_examples/ui_furniture/widget/gradient_container.dart';

class FurnitureUI extends HookWidget {
  const FurnitureUI({required this.onPressedMenu, super.key});

  final VoidCallback onPressedMenu;

  @override
  Widget build(BuildContext context) {
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
            icon: const Icon(CustomIcons.menu, color: Colors.black),
            onPressed: onPressedMenu,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: IconButton(
              icon: const Icon(CustomIcons.search, color: Colors.black),
              onPressed: () {},
            ),
          ),
        ],
      ),
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          const GradientContainer(),
          Positioned(
            top: Responsive().setHeight(Responsive().height * .15),
            left: Responsive().setWidth(30),
            right: Responsive().setHeight(20),
            child: const CustomTitle(
              title: 'Wooden Armchairs',
              subtitle: 'Beautiful armchairs to decorate your home',
            ),
          ),
          Align(
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
                physics: const BouncingScrollPhysics(),
                itemBuilder: (_, index) => FurnitureItem(
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
      bottomNavigationBar: BottomNavigationBar(
        fixedColor: Colors.black,
        currentIndex: currentIndex.value,
        onTap: (index) => currentIndex.value = index,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.panorama_horizontal),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark_border),
            label: '',
          ),
        ],
      ),
      floatingActionButton: SizedBox.fromSize(
        size: Size(Responsive().setWidth(65), Responsive().setHeight(65)),
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: const Color(0x0FFA7B58),
            shape: BoxShape.circle,
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: const Color(0xFFF78A6C).withOpacity(.8),
                blurRadius: 10,
              ),
            ],
          ),
          child: RawMaterialButton(
            onPressed: () {},
            shape: const CircleBorder(),
            child: const Icon(Icons.add, size: 35, color: Colors.white),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
