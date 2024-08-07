/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/book.svg
  String get book => 'assets/icons/book.svg';

  /// File path: assets/icons/calendar.svg
  String get calendar => 'assets/icons/calendar.svg';

  /// File path: assets/icons/cross.svg
  String get cross => 'assets/icons/cross.svg';

  /// File path: assets/icons/statistic.svg
  String get statistic => 'assets/icons/statistic.svg';

  /// List of all assets
  List<String> get values => [book, calendar, cross, statistic];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/anger.png
  AssetGenImage get anger => const AssetGenImage('assets/images/anger.png');

  /// File path: assets/images/calmness.png
  AssetGenImage get calmness =>
      const AssetGenImage('assets/images/calmness.png');

  /// File path: assets/images/fear.png
  AssetGenImage get fear => const AssetGenImage('assets/images/fear.png');

  /// File path: assets/images/happy.png
  AssetGenImage get happy => const AssetGenImage('assets/images/happy.png');

  /// File path: assets/images/sadness.png
  AssetGenImage get sadness => const AssetGenImage('assets/images/sadness.png');

  /// File path: assets/images/strong.png
  AssetGenImage get strong => const AssetGenImage('assets/images/strong.png');

  /// List of all assets
  List<AssetGenImage> get values =>
      [anger, calmness, fear, happy, sadness, strong];
}

class Assets {
  Assets._();

  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
  });

  final String _assetName;

  final Size? size;
  final Set<String> flavors;

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
