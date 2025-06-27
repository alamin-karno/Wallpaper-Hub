import 'package:equatable/equatable.dart';

import 'wallpaper_data.dart';

class PaginatedWallpaperData with EquatableMixin {
  PaginatedWallpaperData({
    required this.page,
    required this.perPage,
    required this.totalResults,
    required this.photos,
    this.nextPage,
  });

  final int page;
  final int perPage;
  final int totalResults;
  final List<WallpaperData> photos;
  final String? nextPage;

  @override
  List<Object?> get props => [page, perPage, totalResults, photos, nextPage];
}
