import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wallpaper_hub/features/home/presentation/cubit/wallpaper_cubit.dart';
import 'package:wallpaper_hub/features/home/presentation/ui/home_page.dart';

import 'core/di/di_container.dart';
import 'core/di/inject.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  initDi();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Wallpaper Hub',
      theme: ThemeData(primaryColor: Colors.white),
      home: BlocProvider(
        create: (context) => WallpaperCubit(inject())..fetchCuratedWallpapers(),
        child: HomePage(),
      ),
    );
  }
}
