import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_ui_examples/common/responsive.dart';
import 'package:flutter_ui_examples/ui_story/model/story_model.dart';
import 'package:flutter_ui_examples/ui_story/widget/card_scroll.dart';
import 'package:flutter_ui_examples/ui_story/widget/custom_icon.dart';
import 'package:flutter_ui_examples/ui_story/widget/custom_tag.dart';
import 'package:flutter_ui_examples/ui_story/widget/custom_title.dart';
import 'package:flutter_ui_examples/ui_story/widget/favorite_item.dart';

class StoryUI extends HookWidget {
  const StoryUI({required this.onPressedMenu, super.key});

  final VoidCallback onPressedMenu;

  @override
  Widget build(BuildContext context) {
    final favoriteList = stories.where((item) => item.isFavorite).toList();

    final currentPage = useState<double>(stories.length - 1);
    final pageController = usePageController(initialPage: stories.length - 1);

    pageController.addListener(
      () => currentPage.value = pageController.page ?? 0,
    );

    return Scaffold(
      backgroundColor: const Color(0xFF243447),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(CustomIcons.menu, color: Colors.white, size: 30),
          onPressed: onPressedMenu,
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.search, color: Colors.white, size: 30),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const CustomTitle(title: 'Trending'),
            const CustomTag(
              title: 'Animated',
              message: '25+ stories',
              tagColor: Color(0xFFFF6E6E),
            ),
            Stack(
              children: <Widget>[
                CardScroll(stories: stories, currentPage: currentPage.value),
                Positioned.fill(
                  child: PageView.builder(
                    reverse: true,
                    itemCount: stories.length,
                    controller: pageController,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (_, __) => const SizedBox(),
                  ),
                ),
              ],
            ),
            const CustomTitle(title: 'Favourite'),
            const CustomTag(
              title: 'Latest',
              message: '9+ Stories',
              tagColor: Colors.blueAccent,
            ),
            SizedBox(
              height: Responsive().setHeight(250),
              child: ListView.builder(
                itemCount: favoriteList.length,
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.symmetric(
                  vertical: Responsive().setHeight(20),
                ),
                itemBuilder: (_, index) => FavoriteItem(
                  image: favoriteList[index].image,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
