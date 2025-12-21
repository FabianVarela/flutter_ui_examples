import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_ui_examples/ui_streaming/model/streaming_model.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

part 'widget/header_section.dart';

part 'widget/streaming_list.dart';

part 'widget/clipper/streaming_clipper.dart';

class StreamingUI extends HookWidget {
  const StreamingUI({required this.onPressedMenu, super.key});

  final VoidCallback onPressedMenu;

  @override
  Widget build(BuildContext context) {
    final currentIndex = useState(0);
    final currentStreaming = useState(streamingList.first);

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: Padding(
          padding: const .only(left: 20),
          child: IconButton(
            icon: const Icon(Icons.menu, color: Colors.white),
            onPressed: onPressedMenu,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            _HeaderSection(
              image: currentStreaming.value.image,
              title: currentStreaming.value.title,
            ),
            _StreamingList(
              streamingList: streamingList,
              onSelectStream: (value) => currentStreaming.value = value,
            ),
          ],
        ),
      ),
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
          labelTextStyle: WidgetStateTextStyle.resolveWith((states) {
            return states.contains(WidgetState.selected)
                ? GoogleFonts.mulish(color: const Color(0xFFE52020))
                : GoogleFonts.mulish();
          }),
        ),
        child: NavigationBar(
          selectedIndex: currentIndex.value,
          onDestinationSelected: (index) => currentIndex.value = index,
          indicatorColor: const Color(0xFFE52020).withValues(alpha: .2),
          destinations: const <Widget>[
            NavigationDestination(
              selectedIcon: Icon(Icons.home, color: Color(0xFFE52020)),
              icon: Icon(Icons.home_outlined),
              label: 'Home',
            ),
            NavigationDestination(
              selectedIcon: Icon(Icons.search, color: Color(0xFFE52020)),
              icon: Icon(Icons.search_rounded),
              label: 'Search',
            ),
            NavigationDestination(
              selectedIcon: Icon(Icons.bookmark, color: Color(0xFFE52020)),
              icon: Icon(Icons.bookmark_border),
              label: 'Bookmarks',
            ),
            NavigationDestination(
              selectedIcon: Icon(Icons.person, color: Color(0xFFE52020)),
              icon: Icon(Icons.person_outline),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}
