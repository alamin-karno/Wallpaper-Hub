// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wallpaper_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WallpaperResponse _$WallpaperResponseFromJson(Map<String, dynamic> json) =>
    WallpaperResponse(
      id: (json['id'] as num).toInt(),
      url: json['url'] as String,
      photographer: json['photographer'] as String,
      photographerUrl: json['photographer_url'] as String,
      photographerId: (json['photographer_id'] as num).toInt(),
      avgColor: json['avg_color'] as String,
      src: SrcResponse.fromJson(json['src'] as Map<String, dynamic>),
      liked: json['liked'] as bool,
    );
