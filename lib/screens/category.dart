import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:wallpaper_hub/data/data.dart';
import 'package:wallpaper_hub/model/wallpaper_model.dart';
import 'package:http/http.dart' as http;
import 'package:wallpaper_hub/screens/loading.dart';
import 'package:wallpaper_hub/widgets/widget.dart';

class Category extends StatefulWidget {

  final String categoryName,imgUrl;
  Category({required this.categoryName,required this.imgUrl});

  @override
  _CategoryState createState() => _CategoryState();
}

class _CategoryState extends State<Category> {

  bool isLoading = false;

  List<WallpaperModel> wallpapers = [];

  getCategoriesWallpapers(String query) async {

    setState(() {
      isLoading = true;
    });

    var response = await http.get(
        Uri.parse('https://api.pexels.com/v1/search?query=$query&per_page=250&page=1'),
        headers: {"Authorization": apiKey});

    Map<String, dynamic> jsonData = jsonDecode(response.body);

    jsonData['photos'].forEach((element) {
      WallpaperModel wallpaperModel = WallpaperModel.fromMap(element);
      wallpapers.add(wallpaperModel);
    });

    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    getCategoriesWallpapers(widget.categoryName.toLowerCase());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: brandName(),
        elevation: 0.0,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [

              Stack(
                children: [
                  ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image(
                        image: CachedNetworkImageProvider(widget.imgUrl),
                        height: 40,
                        width: 100,
                        fit: BoxFit.cover,
                      )
                  ),
                  Container(
                    height: 40,
                    width: 100,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.black26,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Text(
                      widget.categoryName,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  )
                ],
              ),

              SizedBox(height: 16,),

              isLoading ? Loading() : wallpapersList(wallpapers, context),

              SizedBox(height: 16,),
            ],
          ),
        ),
      ),
    );
  }
}
