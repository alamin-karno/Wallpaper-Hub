import 'package:injectable/injectable.dart';
import 'package:wallpaper_hub/features/home/data/datasource/remote/wallpaper_remote_datasource.dart';
import 'package:wallpaper_hub/features/home/domain/entities/paginated_wallpaper_data.dart';
import 'package:wallpaper_hub/features/home/domain/repository/wallpaper_repository.dart';

@Singleton(as: WallpaperRepository)
class WallpaperRepositoryImpl extends WallpaperRepository {
  WallpaperRepositoryImpl(this._remoteDatasource);

  final WallpaperRemoteDatasource _remoteDatasource;

  @override
  Future<PaginatedWallpaperData> getCuratedWallpapers({
    required int perPage,
    required int page,
  }) {
    return _remoteDatasource.getCuratedWallpapers(perPage: perPage, page: page);
  }
}
