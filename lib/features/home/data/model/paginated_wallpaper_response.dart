import 'package:json_annotation/json_annotation.dart';
import 'package:wallpaper_hub/features/home/domain/entities/paginated_wallpaper_data.dart';

import 'wallpaper_response.dart';

part 'paginated_wallpaper_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, createToJson: false)
class PaginatedWallpaperResponse extends PaginatedWallpaperData {
  PaginatedWallpaperResponse({
    required super.page,
    required super.perPage,
    required super.totalResults,
    required List<WallpaperResponse> super.photos,
    super.nextPage,
  });

  factory PaginatedWallpaperResponse.fromJson(Map<String, dynamic> json) =>
      _$PaginatedWallpaperResponseFromJson(json);
}
