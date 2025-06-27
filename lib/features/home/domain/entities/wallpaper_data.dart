import 'package:equatable/equatable.dart';

import 'src_data.dart';

class WallpaperData with EquatableMixin {
  WallpaperData({
    required this.id,
    required this.url,
    required this.photographer,
    required this.photographerUrl,
    required this.photographerId,
    required this.avgColor,
    required this.src,
    required this.liked,
  });

  final int id;
  final String url;
  final String photographer;
  final String photographerUrl;
  final int photographerId;
  final String avgColor;
  final SrcData src;
  final bool liked;

  @override
  List<Object?> get props => [
        id,
        url,
        photographer,
        photographerUrl,
        photographerId,
        avgColor,
        src,
        liked,
      ];
}
