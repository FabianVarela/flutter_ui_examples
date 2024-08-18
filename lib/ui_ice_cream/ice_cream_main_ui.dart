import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_ui_examples/common/gen/assets.gen.dart';
import 'package:flutter_ui_examples/common/gen/fonts.gen.dart';
import 'package:flutter_ui_examples/ui_ice_cream/widget/option_button.dart';
import 'package:gap/gap.dart';

class IceCreamMainUI extends StatelessWidget {
  const IceCreamMainUI({required this.onPressedMenu, super.key});

  final VoidCallback onPressedMenu;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverToBoxAdapter(
            child: _Header(onPressMenu: onPressedMenu),
          ),
          const SliverPadding(
            padding: EdgeInsets.only(top: 30, left: 30),
            sliver: SliverToBoxAdapter(
              child: _Options(),
            ),
          ),
        ],
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header({this.onPressMenu});

  final VoidCallback? onPressMenu;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          width: MediaQuery.sizeOf(context).width * .88,
          height: MediaQuery.sizeOf(context).height * .45,
          padding: const EdgeInsets.only(left: 24),
          decoration: const BoxDecoration(
            color: Color(0xFFF593AF),
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(20),
            ),
          ),
          child: Align(
            alignment: Alignment.centerLeft,
            child: RichText(
              text: const TextSpan(
                text: '\t\t\t\tTHE WORLD OF\n',
                style: TextStyle(fontSize: 16, color: Colors.white),
                children: <TextSpan>[
                  TextSpan(
                    text: 'yummm',
                    style: TextStyle(
                      fontSize: 40,
                      fontFamily: FontFamily.ritts,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        SafeArea(
          bottom: false,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                OptionButton(
                  path: Assets.images.iceCream.dots.path,
                  foregroundColor: const Color(0xFFF11359),
                  onPress: onPressMenu,
                ),
                OptionButton(
                  path: Assets.images.iceCream.search.path,
                  foregroundColor: const Color(0xFFF11359),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          right: 0,
          bottom: 20,
          child: Assets.images.iceCream.iceCreamStraw.image(width: 250),
        ),
      ],
    );
  }
}

class _Options extends HookWidget {
  const _Options();

  @override
  Widget build(BuildContext context) {
    final currentIndex = useState(0);

    final iceCreamAssets = Assets.images.iceCream;
    final optionList = <({String text, String icon})>[
      (text: 'Cup', icon: iceCreamAssets.bowlCream.path),
      (text: 'Candy', icon: iceCreamAssets.palette.path),
      (text: 'Cones', icon: iceCreamAssets.iceCream.path),
      (text: 'Favorites', icon: iceCreamAssets.star.path),
    ];

    return SizedBox.fromSize(
      size: const Size(double.infinity, 120),
      child: ListView.separated(
        itemCount: optionList.length,
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.only(left: 10, top: 5),
        separatorBuilder: (_, __) => const Gap(20),
        itemBuilder: (_, index) => Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            OptionButton(
              path: optionList[index].icon,
              size: const Size(80, 80),
              padding: const EdgeInsets.all(16),
              backgroundColor: currentIndex.value == index
                  ? const Color(0xFFF01359)
                  : const Color(0xFFFFFFFF),
              foregroundColor: currentIndex.value == index
                  ? const Color(0xFFFFFFFF)
                  : Colors.grey,
              onPress: () => currentIndex.value = index,
            ),
            const Gap(6),
            Text(
              optionList[index].text,
              style: TextStyle(
                fontSize: 12,
                color: currentIndex.value == index
                    ? const Color(0xFFF01359)
                    : Colors.grey,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
