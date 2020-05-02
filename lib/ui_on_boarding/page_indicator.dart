import 'package:flutter/material.dart';

class PageIndicator extends StatelessWidget {
  final int currentPage;
  final int pageCount;

  PageIndicator(this.currentPage, this.pageCount);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List<Widget>.generate(pageCount, (int index) {
        return Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 4),
            child: Container(
              height: 4,
              decoration: BoxDecoration(
                color: index == currentPage ? Colors.white : Color(0xFF3E4750),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: Colors.black12,
                    offset: Offset(0.0, 2.0),
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
