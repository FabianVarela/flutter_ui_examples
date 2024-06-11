/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vector_graphics/vector_graphics.dart';

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// Directory path: assets/images/login
  $AssetsImagesLoginGen get login => const $AssetsImagesLoginGen();

  /// Directory path: assets/images/onboarding
  $AssetsImagesOnboardingGen get onboarding =>
      const $AssetsImagesOnboardingGen();

  /// Directory path: assets/images/shopping
  $AssetsImagesShoppingGen get shopping => const $AssetsImagesShoppingGen();
}

class $AssetsImagesLoginGen {
  const $AssetsImagesLoginGen();

  /// File path: assets/images/login/facebook.svg
  SvgGenImage get facebook =>
      const SvgGenImage('assets/images/login/facebook.svg');

  /// File path: assets/images/login/google.svg
  SvgGenImage get google => const SvgGenImage('assets/images/login/google.svg');

  /// File path: assets/images/login/linked_in.svg
  SvgGenImage get linkedIn =>
      const SvgGenImage('assets/images/login/linked_in.svg');

  /// File path: assets/images/login/login_image_01.png
  AssetGenImage get loginImage01 =>
      const AssetGenImage('assets/images/login/login_image_01.png');

  /// File path: assets/images/login/login_image_02.png
  AssetGenImage get loginImage02 =>
      const AssetGenImage('assets/images/login/login_image_02.png');

  /// File path: assets/images/login/login_logo.png
  AssetGenImage get loginLogo =>
      const AssetGenImage('assets/images/login/login_logo.png');

  /// File path: assets/images/login/twitter.svg
  SvgGenImage get twitter =>
      const SvgGenImage('assets/images/login/twitter.svg');

  /// List of all assets
  List<dynamic> get values => [
        facebook,
        google,
        linkedIn,
        loginImage01,
        loginImage02,
        loginLogo,
        twitter
      ];
}

class $AssetsImagesOnboardingGen {
  const $AssetsImagesOnboardingGen();

  /// File path: assets/images/onboarding/illustration.png
  AssetGenImage get illustration =>
      const AssetGenImage('assets/images/onboarding/illustration.png');

  /// File path: assets/images/onboarding/illustration2.png
  AssetGenImage get illustration2 =>
      const AssetGenImage('assets/images/onboarding/illustration2.png');

  /// File path: assets/images/onboarding/illustration3.png
  AssetGenImage get illustration3 =>
      const AssetGenImage('assets/images/onboarding/illustration3.png');

  /// List of all assets
  List<AssetGenImage> get values =>
      [illustration, illustration2, illustration3];
}

class $AssetsImagesShoppingGen {
  const $AssetsImagesShoppingGen();

  /// File path: assets/images/shopping/cart.svg
  SvgGenImage get cart => const SvgGenImage('assets/images/shopping/cart.svg');

  /// File path: assets/images/shopping/favorite.svg
  SvgGenImage get favorite =>
      const SvgGenImage('assets/images/shopping/favorite.svg');

  /// File path: assets/images/shopping/logo.png
  AssetGenImage get logo =>
      const AssetGenImage('assets/images/shopping/logo.png');

  /// File path: assets/images/shopping/profile.png
  AssetGenImage get profile =>
      const AssetGenImage('assets/images/shopping/profile.png');

  /// File path: assets/images/shopping/search.svg
  SvgGenImage get search =>
      const SvgGenImage('assets/images/shopping/search.svg');

  /// File path: assets/images/shopping/shoes_01.png
  AssetGenImage get shoes01 =>
      const AssetGenImage('assets/images/shopping/shoes_01.png');

  /// File path: assets/images/shopping/shoes_02.png
  AssetGenImage get shoes02 =>
      const AssetGenImage('assets/images/shopping/shoes_02.png');

  /// File path: assets/images/shopping/store.png
  AssetGenImage get store =>
      const AssetGenImage('assets/images/shopping/store.png');

  /// List of all assets
  List<dynamic> get values =>
      [cart, favorite, logo, profile, search, shoes01, shoes02, store];
}

class Assets {
  Assets._();

  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName, {this.size = null});

  final String _assetName;

  final Size? size;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

class SvgGenImage {
  const SvgGenImage(
    this._assetName, {
    this.size = null,
  }) : _isVecFormat = false;

  const SvgGenImage.vec(
    this._assetName, {
    this.size = null,
  }) : _isVecFormat = true;

  final String _assetName;

  final Size? size;
  final bool _isVecFormat;

  SvgPicture svg({
    Key? key,
    bool matchTextDirection = false,
    AssetBundle? bundle,
    String? package,
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    AlignmentGeometry alignment = Alignment.center,
    bool allowDrawingOutsideViewBox = false,
    WidgetBuilder? placeholderBuilder,
    String? semanticsLabel,
    bool excludeFromSemantics = false,
    SvgTheme? theme,
    ColorFilter? colorFilter,
    Clip clipBehavior = Clip.hardEdge,
    @deprecated Color? color,
    @deprecated BlendMode colorBlendMode = BlendMode.srcIn,
    @deprecated bool cacheColorFilter = false,
  }) {
    return SvgPicture(
      _isVecFormat
          ? AssetBytesLoader(_assetName,
              assetBundle: bundle, packageName: package)
          : SvgAssetLoader(_assetName,
              assetBundle: bundle, packageName: package),
      key: key,
      matchTextDirection: matchTextDirection,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      theme: theme,
      colorFilter: colorFilter ??
          (color == null ? null : ColorFilter.mode(color, colorBlendMode)),
      clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
