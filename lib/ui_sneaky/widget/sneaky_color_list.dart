import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class SneakyColorList extends HookWidget {
  const SneakyColorList({required this.colors, super.key});

  final List<Color> colors;

  @override
  Widget build(BuildContext context) {
    final current = useState<int?>(null);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Text(
          'Color'.toUpperCase(),
          style: const TextStyle(
            // fontFamily: 'AvenirLTStd',
            fontSize: 16,
            fontWeight: FontWeight.w900,
          ),
        ),
        Container(
          height: 50,
          margin: const EdgeInsets.only(top: 15),
          child: ListView.builder(
            itemCount: colors.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (_, index) => GestureDetector(
              onTap: () => current.value = index,
              child: Container(
                width: 50,
                margin: const EdgeInsets.only(right: 10),
                decoration: BoxDecoration(
                  color: colors[index],
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    width: current.value == index ? 2 : 1,
                    color: current.value == index ? Colors.black : Colors.grey,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
