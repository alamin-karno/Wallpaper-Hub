import 'dart:developer';

import 'package:share_plus/share_plus.dart';
import 'package:wallpaper_hub/features/home/domain/entities/wallpaper_data.dart';

class AppHelper {
  static final _share = SharePlus.instance;

  static Future<void> shareWallpaperLink({
    required WallpaperData wallpaper,
  }) async {
    final params = ShareParams(
      title: 'Share Photo by ${wallpaper.photographer}',
      subject: 'WallpaperHub Photo',
      text: 'View Original Photo by ${wallpaper.photographer}\n'
          'Original Photo: ${wallpaper.src.original}',
    );

    final result = await _share.share(params);

    log('Share result: $result');
  }
}
