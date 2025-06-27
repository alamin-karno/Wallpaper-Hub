part of 'wallpaper_cubit.dart';

abstract class WallpaperState {}

final class WallpaperInitialState extends WallpaperState {}

final class WallpaperLoadingState extends WallpaperState {}

final class WallpaperLoadedState extends WallpaperState {
  WallpaperLoadedState(this.data);

  final PaginatedWallpaperData data;
}

final class WallpaperErrorState extends WallpaperState {
  WallpaperErrorState(this.message);

  final String message;
}
