// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:wallpaper_hub/core/dio/dio_module.dart' as _i553;
import 'package:wallpaper_hub/features/home/data/datasource/wallpaper_rest_client.dart'
    as _i980;
import 'package:wallpaper_hub/features/home/data/repository/wallpaper_repository_impl.dart'
    as _i828;
import 'package:wallpaper_hub/features/home/domain/repository/wallpaper_repository.dart'
    as _i927;
import 'package:wallpaper_hub/features/home/domain/usecase/get_curated_wallpapers_usecase.dart'
    as _i674;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final dioModule = _$DioModule();
    gh.singleton<_i361.Dio>(
      () => dioModule.getAuthorizedDioClient(),
      instanceName: 'Authorized',
    );
    gh.singleton<_i361.Dio>(
      () => dioModule.getUnauthorizedDioClient(),
      instanceName: 'Unauthorized',
    );
    gh.singleton<_i980.WallpaperRestClient>(() =>
        _i980.WallpaperRestClient(gh<_i361.Dio>(instanceName: 'Authorized')));
    gh.singleton<_i927.WallpaperRepository>(
        () => _i828.WallpaperRepositoryImpl(gh<_i980.WallpaperRestClient>()));
    gh.singleton<_i674.GetCuratedWallPapersUsecase>(() =>
        _i674.GetCuratedWallPapersUsecase(
            wallpaperRepository: gh<_i927.WallpaperRepository>()));
    return this;
  }
}

class _$DioModule extends _i553.DioModule {}
