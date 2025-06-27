import 'package:injectable/injectable.dart';
import 'package:wallpaper_hub/features/home/domain/entities/paginated_wallpaper_data.dart';
import 'package:wallpaper_hub/features/home/domain/repository/wallpaper_repository.dart';

@injectable
class GetCuratedWallPapersUsecase {
  GetCuratedWallPapersUsecase({
    required WallpaperRepository wallpaperRepository,
  }) : _wallpaperRepository = wallpaperRepository;

  final WallpaperRepository _wallpaperRepository;

  Future<PaginatedWallpaperData> call({
    required int perPage,
    required int page,
  }) async {
    return await _wallpaperRepository.getCuratedWallpapers(
      perPage: perPage,
      page: page,
    );
  }
}
