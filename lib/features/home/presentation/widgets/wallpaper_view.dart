import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shimmer/shimmer.dart';
import 'package:wallpaper_hub/app/navigation/navigation.dart';
import 'package:wallpaper_hub/features/home/domain/entities/wallpaper_data.dart';

class WallpaperView extends StatelessWidget {
  const WallpaperView({
    super.key,
    required this.index,
    required this.wallpaper,
  });

  final int index;
  final WallpaperData wallpaper;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.push(AppRoute.details, extra: wallpaper);
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.grey,
        ),
        clipBehavior: Clip.antiAlias,
        child: CachedNetworkImage(
          fit: BoxFit.cover,
          imageUrl: wallpaper.src.large,
          placeholder: (context, url) => Shimmer.fromColors(
            baseColor: Colors.white54,
            highlightColor: Colors.white70,
            child: Container(
              height: (index % 5 + 1) * 100,
              child: Icon(
                Icons.image,
                color: Colors.grey.shade300,
                size: 50,
              ),
            ),
          ),
          errorWidget: (context, url, error) => Icon(
            Icons.image,
            color: Colors.grey.shade300,
          ),
        ),
      ),
    );
  }
}
