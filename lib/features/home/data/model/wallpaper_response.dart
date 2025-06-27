import 'package:json_annotation/json_annotation.dart';
import 'package:wallpaper_hub/features/home/domain/entities/wallpaper_data.dart';

import 'src_response.dart';

part 'wallpaper_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, createToJson: false)
class WallpaperResponse extends WallpaperData {
  WallpaperResponse({
    required super.id,
    required super.url,
    required super.photographer,
    required super.photographerUrl,
    required super.photographerId,
    required super.avgColor,
    required SrcResponse super.src,
    required super.liked,
  });

  factory WallpaperResponse.fromJson(Map<String, dynamic> json) =>
      _$WallpaperResponseFromJson(json);
}
