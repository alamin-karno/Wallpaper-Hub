import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:wallpaper_hub/model/wallpaper_model.dart';
import 'package:wallpaper_hub/screens/image_fullview.dart';

Widget brandName() {
  return RichText(text: TextSpan(
    style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500),
    children: <TextSpan> [
      TextSpan(text: 'Wallpaper',style: TextStyle(color: Colors.black87)),
      TextSpan(text: 'Hub',style: TextStyle(color: Colors.blue)),
    ]
  ));
}

Widget wallpapersList(List<WallpaperModel> wallpapers, context) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 16),
    child: GridView.count(
      shrinkWrap: true,
      physics: ClampingScrollPhysics(),
      crossAxisCount: (kIsWeb) ? 5 : 2,
      childAspectRatio: 0.6,
      mainAxisSpacing: 6.0,
      crossAxisSpacing: 6.0,
      children: wallpapers.map((wallpaper) {
        return GridTile(
            child: GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                    builder: (context) => ImageView(imgUrl: wallpaper.src.portrait,imgUrlLarge: wallpaper.src.landscape,wallpapers: wallpapers,)));
              },
              child: Hero(
                tag: wallpaper.src.portrait,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.black26,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image(
                        image: (kIsWeb) ?  CachedNetworkImageProvider(wallpaper.src.large) : CachedNetworkImageProvider(wallpaper.src.portrait),
                        fit: BoxFit.cover,),
                  ),
                ),
              ),
            ));
      }).toList(),
    ),
  );
}