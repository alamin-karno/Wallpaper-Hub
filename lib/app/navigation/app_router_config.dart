import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:wallpaper_hub/app/app.dart';
import 'package:wallpaper_hub/core/di/inject.dart';
import 'package:wallpaper_hub/features/home/domain/entities/wallpaper_data.dart';

import '../../features/details/details.dart';
import '../../features/home/home.dart';
import 'navigation.dart';

class AppRouterConfig {
  static final router = GoRouter(
    routes: _routes,
    initialLocation: AppRoute.root,
  );

  static final _routes = [
    GoRoute(
      path: AppRoute.root,
      builder: (context, state) => BlocProvider(
        create: (context) => WallpaperCubit(inject())..fetchCuratedWallpapers(),
        child: MainView(),
      ),
    ),
    GoRoute(
      path: AppRoute.details,
      builder: (context, state) => DetailsPage(
        wallpaper: state.extra as WallpaperData,
      ),
    ),
  ];
}
