import 'dart:async';
import 'dart:ui' as ui;
import 'package:blurhash/uiimage.dart';
import 'package:flutter/services.dart';

import 'blurhash_platform_interface.dart';

class BlurHash {
  static Future<String> encode(
      Uint8List image, int componentX, int componentY) {
    return BlurHashPlatform.instance.encode(image, componentX, componentY);
  }

  static Future<Uint8List?> decode(String blurHash, int width, int height,
      {double punch = 1.0, bool useCache = true}) {
    return BlurHashPlatform.instance
        .decode(blurHash, width, height, punch: punch, useCache: useCache);
  }

  static Future<UiImage> toImageProvider(String blurHash, int width, int height,
      {double punch = 1.0, bool useCache = true, double scale = 1.0}) async {
    final img = await BlurHashPlatform.instance
        .toImage(blurHash, width, height, punch: punch, useCache: useCache);
    return UiImage(img, scale: scale);
  }

  static Future<ui.Image> toImage(String blurHash, int width, int height,
      {double punch = 1.0, bool useCache = true, double scale = 1.0}) async {
    final img = await BlurHashPlatform.instance
        .toImage(blurHash, width, height, punch: punch, useCache: useCache);
    return img;
  }
}
