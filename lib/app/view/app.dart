import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wallpaper_hub/core/di/inject.dart';
import 'package:wallpaper_hub/features/home/presentation/cubit/wallpaper_cubit.dart';

import 'main_view.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Wallpaper Hub',
      theme: ThemeData(primaryColor: Colors.white, useMaterial3: true),
      home: BlocProvider(
        create: (context) => WallpaperCubit(inject())..fetchCuratedWallpapers(),
        child: MainView(),
      ),
    );
  }
}
