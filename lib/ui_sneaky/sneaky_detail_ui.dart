import 'package:flutter/material.dart';
import 'package:flutter_ui_examples/ui_sneaky/model/sneaky_model.dart';
import 'package:flutter_ui_examples/ui_sneaky/widget/custom_button.dart';
import 'package:flutter_ui_examples/ui_sneaky/widget/custom_icon_button.dart';
import 'package:flutter_ui_examples/ui_sneaky/widget/sneaky_color_list.dart';
import 'package:flutter_ui_examples/ui_sneaky/widget/sneaky_size_list.dart';

class SneakyDetailArguments {
  SneakyDetailArguments(this.sneaky, this.uuid);

  final Sneaky sneaky;
  final String uuid;
}

class SneakyDetailUI extends StatelessWidget {
  const SneakyDetailUI({required this.sneaky, required this.uuid, super.key});

  final Sneaky sneaky;
  final String uuid;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(.9),
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Positioned.fill(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(16, 10, 16, 30),
                child: Stack(
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Hero(tag: uuid, child: Image.asset(sneaky.image)),
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Text(
                            '\$ ${sneaky.price.toStringAsFixed(2)}',
                            style: const TextStyle(
                              // fontFamily: 'PoetsenOne',
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Text(
                            sneaky.name,
                            style: const TextStyle(
                              // fontFamily: 'AvenirLTStd',
                              fontSize: 25,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 30),
                          child: SneakyColorList(colors: sneaky.colors),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 30),
                          child: SneakySizeList(sizes: sneaky.sizes),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 50),
                          child: Text(
                            sneaky.description,
                            style: const TextStyle(
                              // fontFamily: 'AvenirLTStd',
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              left: 16,
              right: 16,
              bottom: 0,
              child: Row(
                children: <Widget>[
                  CustomIconButton(
                    iconData: Icons.arrow_back,
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: CustomButton(
                        text: 'Add to bag'.toUpperCase(),
                        onPressed: () {},
                      ),
                    ),
                  ),
                  CustomIconButton(
                    iconData: Icons.email_outlined,
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
