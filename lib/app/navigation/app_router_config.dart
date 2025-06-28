import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:wallpaper_hub/app/app.dart';
import 'package:wallpaper_hub/app/navigation/app_route.dart';
import 'package:wallpaper_hub/core/di/inject.dart';
import 'package:wallpaper_hub/features/home/presentation/cubit/wallpaper_cubit.dart';

class AppRouterConfig {
  late final router = GoRouter(
    routes: _routes,
    initialLocation: AppRoute.root,
  );

  late final _routes = [
    GoRoute(
      path: '/',
      name: AppRoute.root,
      builder: (context, state) => BlocProvider(
        create: (context) => WallpaperCubit(inject())..fetchCuratedWallpapers(),
        child: MainView(),
      ),
    ),
  ];
}
