import 'package:wallpaper_hub/features/home/domain/entities/paginated_wallpaper_data.dart';

abstract class WallpaperRepository {
  Future<PaginatedWallpaperData> getCuratedWallpapers({
    required int perPage,
    required int page,
  });
}
