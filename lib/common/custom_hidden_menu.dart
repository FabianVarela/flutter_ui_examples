import 'package:flutter/material.dart';

class CustomHiddenMenu extends StatefulWidget {
  CustomHiddenMenu({
    required this.menu,
    required this.child,
    this.isOpen = false,
  });

  final Widget menu;
  final Widget child;
  final bool isOpen;

  @override
  _CustomHiddenMenuState createState() => _CustomHiddenMenuState();
}

class _CustomHiddenMenuState extends State<CustomHiddenMenu>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Curve _curve;

  double _value = 0.0;

  double _width = 0;
  double _slideAmount = 0.0;
  double _contentScale = 1.0;
  double _cornerRadius = 0.0;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final RenderBox? renderBox = context.findRenderObject() as RenderBox?;
      _width = renderBox?.size.width ?? 0;

      setState(() {});
    });

    _controller = AnimationController(vsync: this);
    _curve = Interval(0.0, 1.0, curve: Curves.decelerate);

    _controller
      ..duration = Duration(milliseconds: 500)
      ..addListener(() => _value = _curve.transform(_controller.value))
      ..addStatusListener((AnimationStatus status) {
        if (status == AnimationStatus.dismissed) {
          _value = 0.0;
        } else if (status == AnimationStatus.completed) {
          _value = 1.0;
        }
      });
  }

  @override
  void didUpdateWidget(CustomHiddenMenu oldWidget) {
    if (oldWidget.isOpen != widget.isOpen) {
      if (widget.isOpen) {
        _open();
      } else {
        _close();
      }
    }

    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        widget.menu,
        AnimatedBuilder(
          animation: _controller,
          builder: (_, Widget? child) {
            final double animatePercent = _value;

            _slideAmount = (_width / 100 * 80) * animatePercent;
            _contentScale = 1.0 - (((100 - 80) / 100) * animatePercent);
            _cornerRadius = 10 * animatePercent;

            return Transform(
              transform: Matrix4.translationValues(_slideAmount, 0.0, 0.0)
                ..scale(_contentScale, _contentScale),
              alignment: Alignment.centerLeft,
              child: Container(
                decoration: BoxDecoration(
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                      color: Color(0x44000000),
                      offset: Offset(0.0, 5.0),
                      blurRadius: 20,
                      spreadRadius: 5,
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(_cornerRadius),
                  child: child,
                ),
              ),
            );
          },
          child: widget.child,
        ),
      ],
    );
  }

  void _open([double percent = 0.0]) => _controller.forward(from: percent);

  void _close([double percent = 1.0]) => _controller.reverse(from: percent);
}
