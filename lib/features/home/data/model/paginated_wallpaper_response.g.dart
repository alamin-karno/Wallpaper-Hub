// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paginated_wallpaper_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaginatedWallpaperResponse _$PaginatedWallpaperResponseFromJson(
        Map<String, dynamic> json) =>
    PaginatedWallpaperResponse(
      page: (json['page'] as num).toInt(),
      perPage: (json['per_page'] as num).toInt(),
      totalResults: (json['total_results'] as num).toInt(),
      photos: (json['photos'] as List<dynamic>)
          .map((e) => WallpaperResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextPage: json['next_page'] as String?,
    );
