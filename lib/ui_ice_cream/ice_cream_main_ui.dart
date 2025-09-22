import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_ui_examples/common/gen/assets.gen.dart';
import 'package:flutter_ui_examples/common/gen/fonts.gen.dart';
import 'package:flutter_ui_examples/ui_ice_cream/ice_cream_detail_ui.dart';
import 'package:flutter_ui_examples/ui_ice_cream/model/ice_cream_model.dart';
import 'package:flutter_ui_examples/ui_ice_cream/widget/ice_cream_icon_button.dart';
import 'package:flutter_ui_examples/ui_ice_cream/widget/ice_cream_item.dart';
import 'package:gap/gap.dart';

class IceCreamMainUI extends StatelessWidget {
  const IceCreamMainUI({required this.onPressedMenu, super.key});

  final VoidCallback onPressedMenu;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverToBoxAdapter(child: _Header(onPressMenu: onPressedMenu)),
          const SliverPadding(
            padding: EdgeInsets.only(top: 30, left: 30),
            sliver: SliverToBoxAdapter(child: _Options()),
          ),
          const SliverPadding(
            padding: EdgeInsets.only(top: 20, left: 30, right: 24),
            sliver: SliverToBoxAdapter(child: _Popular()),
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
            borderRadius: BorderRadius.only(bottomRight: Radius.circular(20)),
          ),
          child: Align(
            alignment: Alignment.centerLeft,
            child: RichText(
              text: const TextSpan(
                text: '\t\t\t\t\tTHE WORLD OF\n',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontFamily: FontFamily.museoSansCyrl,
                  fontWeight: FontWeight.w300,
                ),
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
                IceCreamIconButton(
                  path: Assets.svg.iceCream.dots,
                  foregroundColor: const Color(0xFFF11359),
                  onPress: onPressMenu,
                ),
                IceCreamIconButton(
                  path: Assets.svg.iceCream.search,
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

    final optionList = <({String text, String icon})>[
      (text: 'Cup', icon: Assets.svg.iceCream.bowlCream),
      (text: 'Candy', icon: Assets.svg.iceCream.palette),
      (text: 'Cones', icon: Assets.svg.iceCream.iceCream),
      (text: 'Favorites', icon: Assets.svg.iceCream.star),
    ];

    return SizedBox.fromSize(
      size: const Size(double.infinity, 120),
      child: ListView.separated(
        itemCount: optionList.length,
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.only(left: 10, top: 5),
        separatorBuilder: (_, _) => const Gap(20),
        itemBuilder: (_, index) => Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            IceCreamIconButton(
              path: optionList[index].icon,
              size: const Size(80, 80),
              padding: const EdgeInsets.all(20),
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
                fontSize: 14,
                color: currentIndex.value == index
                    ? const Color(0xFFF01359)
                    : Colors.grey,
                fontFamily: FontFamily.museoSansCyrl,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Popular extends StatelessWidget {
  const _Popular();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Text(
          'Popular',
          style: TextStyle(
            fontSize: 20,
            color: Color(0xFFF01359),
            fontFamily: FontFamily.museoSansCyrl,
            fontWeight: FontWeight.w600,
          ),
        ),
        const Gap(16),
        ...[
          for (final item in iceCreamList) ...[
            IceCreamItem(
              iceCream: item,
              onPress: () => _goToDetail(context, item),
            ),
            const Gap(2),
          ],
        ],
      ],
    );
  }

  Future<void> _goToDetail(BuildContext context, IceCreamModel iceCream) async {
    await Navigator.of(context).pushNamed(
      '/ice_cream_detail',
      arguments: IceCreamDetailArguments(iceCream),
    );
  }
}
