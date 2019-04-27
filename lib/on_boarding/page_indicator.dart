import 'package:flutter/material.dart';

class PageIndicator extends StatelessWidget {
  final int _currentPage;
  final int _pageCount;

  PageIndicator(this._currentPage, this._pageCount);

  Widget _indicator(bool isActive) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 4),
        child: Container(
          height: 4,
          decoration: BoxDecoration(
            color: isActive ? Colors.white : Color(0xFF3E4750),
            boxShadow: [
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
  }

  List<Widget> _buildPageIndicators() {
    List<Widget> indicatorList = [];

    for (int i = 0; i < _pageCount; i++) {
      indicatorList
          .add(i == _currentPage ? _indicator(true) : _indicator(false));
    }

    return indicatorList;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: _buildPageIndicators(),
    );
  }
}
