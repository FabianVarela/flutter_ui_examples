import 'package:flutter/material.dart';
import 'package:flutter_ui_examples/ui_sneaky/model/sneaky_model.dart';

class SneakyItem extends StatelessWidget {
  const SneakyItem({required this.sneaky, required this.uuid, super.key});

  final Sneaky sneaky;
  final String uuid;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      margin: const EdgeInsets.symmetric(horizontal: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Container(
        width: 300,
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Hero(
              tag: uuid,
              child: Image.asset(sneaky.image, width: 200, height: 150),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 35),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(bottom: 2),
                          child: Text(
                            '\$ ${sneaky.price.toStringAsFixed(2)}',
                            style: const TextStyle(
                              fontFamily: 'AvenirLTStd',
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: Text(
                            sneaky.name,
                            style: const TextStyle(
                              fontFamily: 'AvenirLTStd',
                              fontSize: 16,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            physics: const NeverScrollableScrollPhysics(),
                            children: <Widget>[
                              for (final color in sneaky.colors)
                                Padding(
                                  padding: const EdgeInsets.only(right: 8),
                                  child: SizedBox.fromSize(
                                    size: const Size(10, 10),
                                    child: Container(color: color),
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox.fromSize(
                    size: const Size(40, 40),
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(width: 2),
                      ),
                      child: const Icon(Icons.add),
                    ),
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
