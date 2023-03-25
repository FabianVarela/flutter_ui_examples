import 'package:flutter/material.dart';

class Responsive {
  factory Responsive() => _instance;

  Responsive._();

  static final Responsive _instance = Responsive._();

  static const int _defaultWidth = 1080;
  static const int _defaultHeight = 1920;

  double width = 0;
  double height = 0;

  bool allowFontScaling = false;

  static double _screenWidth = 0;
  static double _screenHeight = 0;
  static double _textScaleFactor = 0;

  static void init(
    BuildContext context, {
    num width = _defaultWidth,
    num height = _defaultHeight,
    bool allowFontScaling = false,
  }) {
    _instance.width = width as double;
    _instance.height = height as double;
    _instance.allowFontScaling = allowFontScaling;

    final mediaQuery = MediaQuery.of(context);

    _screenWidth = mediaQuery.size.width;
    _screenHeight = mediaQuery.size.height;
    _textScaleFactor = mediaQuery.textScaleFactor;
  }

  double get scaleWidth => _screenWidth / width;

  double get scaleHeight => _screenHeight / height;

  double get textScale => scaleWidth;

  double setWidth(double width) => width * scaleWidth;

  double setHeight(double height) => height * scaleHeight;

  /// Respect text size accessibility if {allowFontScaling} is true,
  /// default is false.
  double setSp(double fontSize) => allowFontScaling
      ? fontSize * textScale
      : (fontSize * textScale) / _textScaleFactor;
}
