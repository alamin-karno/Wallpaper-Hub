import 'package:bloc/bloc.dart';
import 'package:wallpaper_hub/features/home/domain/entities/paginated_wallpaper_data.dart';
import 'package:wallpaper_hub/features/home/domain/usecase/get_curated_wallpapers_usecase.dart';

part 'wallpaper_state.dart';

class WallpaperCubit extends Cubit<WallpaperState> {
  WallpaperCubit(
    this._getCuratedWallPapersUsecase,
  ) : super(WallpaperInitialState());

  final GetCuratedWallPapersUsecase _getCuratedWallPapersUsecase;

  void fetchCuratedWallpapers() async {
    emit(WallpaperLoadingState());

    try {
      final result = await _getCuratedWallPapersUsecase.call(
        perPage: 20,
        page: 1,
      );

      emit(WallpaperLoadedState(result));
    } catch (e) {
      emit(WallpaperErrorState(e.toString()));
    }
  }
}
