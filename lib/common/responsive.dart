import 'package:flutter/material.dart';

class Responsive {
  static Responsive _instance;

  static const int _defaultWidth = 1080;
  static const int _defaultHeight = 1920;

  double width;
  double height;

  bool allowFontScaling;

  static double _screenWidth;
  static double _screenHeight;
  static double _textScaleFactor;

  Responsive._();

  factory Responsive() => _instance;

  static void init(
      BuildContext context, {
        num width = _defaultWidth,
        num height = _defaultHeight,
        bool allowFontScaling = false,
      }) {
    _instance ??= Responsive._();

    _instance.width = width;
    _instance.height = height;
    _instance.allowFontScaling = allowFontScaling;

    final MediaQueryData mediaQuery = MediaQuery.of(context);

    _screenWidth = mediaQuery.size.width;
    _screenHeight = mediaQuery.size.height;
    _textScaleFactor = mediaQuery.textScaleFactor;
  }

  double get scaleWidth => _screenWidth / width;

  double get scaleHeight => _screenHeight / height;

  double get textScale => scaleWidth;

  double setWidth(double width) => width * scaleWidth;

  double setHeight(double height) => height * scaleHeight;

  /// Respect text size accessibility if {allowFontScaling} is true, default is false
  double setSp(double fontSize) => allowFontScaling
      ? fontSize * textScale
      : (fontSize * textScale) / _textScaleFactor;
}
