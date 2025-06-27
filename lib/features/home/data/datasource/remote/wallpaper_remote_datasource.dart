import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import 'package:wallpaper_hub/features/home/data/model/paginated_wallpaper_response.dart';

part 'wallpaper_remote_datasource.g.dart';

@RestApi()
@singleton
abstract class WallpaperRemoteDatasource {
  @factoryMethod
  factory WallpaperRemoteDatasource(@Named("Authorized") Dio dio) =
      _WallpaperRemoteDatasource;

  @GET('/curated')
  Future<PaginatedWallpaperResponse> getCuratedWallpapers({
    @Query('per_page') required int perPage,
    @Query('page') required int page,
  });
}
