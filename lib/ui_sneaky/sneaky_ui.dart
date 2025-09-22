import 'package:flutter/material.dart';
import 'package:flutter_ui_examples/common/gen/fonts.gen.dart';
import 'package:flutter_ui_examples/ui_sneaky/model/sneaky_model.dart';
import 'package:flutter_ui_examples/ui_sneaky/sneaky_detail_ui.dart';
import 'package:flutter_ui_examples/ui_sneaky/widget/custom_icon_button.dart';
import 'package:gap/gap.dart';
import 'package:uuid/uuid.dart';

part 'widget/main/sneaky_item.dart';

class SneakyUI extends StatelessWidget {
  const SneakyUI({required this.onPressedMenu, super.key});

  final VoidCallback onPressedMenu;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withValues(alpha: .9),
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: <Widget>[
            ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 30),
              children: sneakyCategories.map((item) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 40),
                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            item.name,
                            style: const TextStyle(
                              fontFamily: FontFamily.poetsenOne,
                              fontSize: 30,
                            ),
                          ),
                          Row(
                            children: <Widget>[
                              Text(
                                '${item.quantity}',
                                style: const TextStyle(
                                  fontFamily: FontFamily.poetsenOne,
                                  fontSize: 18,
                                ),
                              ),
                              const Gap(2),
                              const Icon(Icons.arrow_forward_ios, size: 18),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 330,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: item.sneakyList.length,
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          itemBuilder: (_, index) {
                            final uuid = const Uuid().v1();
                            final sneaky = item.sneakyList[index];

                            return GestureDetector(
                              onTap: () => _goToDetail(context, sneaky, uuid),
                              child: _SneakyItem(sneaky: sneaky, uuid: uuid),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
            Positioned(
              left: 16,
              right: 16,
              bottom: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  CustomIconButton(
                    iconData: Icons.menu_rounded,
                    onPressed: onPressedMenu,
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      CustomIconButton(
                        iconData: Icons.search_outlined,
                        onPressed: () {},
                      ),
                      const Gap(10),
                      CustomIconButton(
                        iconData: Icons.arrow_right_alt_outlined,
                        onPressed: () {},
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _goToDetail(
    BuildContext context,
    Sneaky sneaky,
    String uuid,
  ) async {
    await Navigator.of(context).pushNamed(
      '/sneaky_detail',
      arguments: SneakyDetailArguments(sneaky, uuid),
    );
  }
}
