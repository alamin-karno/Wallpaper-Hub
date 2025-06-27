import 'package:flutter/material.dart';
import 'package:wallpaper_hub/features/home/presentation/widgets/wallpaper_gridview.dart';

import '../../../../core/shared/shared.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: ClampingScrollPhysics(),
        slivers: [
          SliverAppBar(title: AppNameWidget()),
          SliverToBoxAdapter(child: WallpaperGridview()),
        ],
      ),
    );
  }
}
