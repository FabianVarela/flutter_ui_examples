import 'package:flutter/material.dart';

class PageIndicator extends StatelessWidget {
  const PageIndicator(this.currentPage, this.pageCount, {super.key});

  final int currentPage;
  final int pageCount;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List<Widget>.generate(pageCount, (index) {
        return Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: Container(
              height: 4,
              decoration: BoxDecoration(
                color: index == currentPage
                    ? Colors.white
                    : const Color(0xFF3E4750),
                boxShadow: const <BoxShadow>[
                  BoxShadow(
                    color: Colors.black12,
                    offset: Offset(0, 2),
                    blurRadius: 2,
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
