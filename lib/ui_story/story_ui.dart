import 'dart:math';

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_ui_examples/common/gen/assets.gen.dart';
import 'package:flutter_ui_examples/ui_story/model/story_model.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vector_graphics/vector_graphics.dart';

part 'widget/card_scroll.dart';

part 'widget/custom_tag.dart';

part 'widget/custom_title.dart';

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
          icon: VectorGraphic(
            loader: AssetBytesLoader(Assets.svg.story.menu),
            height: 30,
            colorFilter: const .mode(Colors.white, .srcIn),
          ),
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
        padding: const .only(bottom: 20),
        child: Column(
          children: <Widget>[
            const _CustomTitle(title: 'Trending'),
            const _CustomTag(
              title: 'Animated',
              message: '25+ stories',
              tagColor: Color(0xFFFF6E6E),
            ),
            Stack(
              children: <Widget>[
                _CardScroll(stories: stories, currentPage: currentPage.value),
                Positioned.fill(
                  child: PageView.builder(
                    reverse: true,
                    itemCount: stories.length,
                    controller: pageController,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (_, _) => const Offstage(),
                  ),
                ),
              ],
            ),
            const _CustomTitle(title: 'Favourite'),
            const _CustomTag(
              title: 'Latest',
              message: '9+ Stories',
              tagColor: Colors.blueAccent,
            ),
            SizedBox(
              height: 250,
              child: ListView.builder(
                itemCount: favoriteList.length,
                scrollDirection: .horizontal,
                padding: const .symmetric(vertical: 20),
                itemBuilder: (_, index) => Padding(
                  padding: const .only(left: 18, right: 12),
                  child: ClipRRect(
                    borderRadius: .circular(20),
                    child: SizedBox.fromSize(
                      size: const Size(296, 222),
                      child: Image.asset(favoriteList[index].image),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
