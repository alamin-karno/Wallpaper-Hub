import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:wallpaper_hub/data/data.dart';
import 'package:wallpaper_hub/model/categories_model.dart';
import 'package:wallpaper_hub/model/wallpaper_model.dart';
import 'package:wallpaper_hub/screens/category.dart';
import 'package:wallpaper_hub/screens/image_fullview.dart';
import 'package:wallpaper_hub/screens/loading.dart';
import 'package:wallpaper_hub/screens/search.dart';
import 'package:wallpaper_hub/widgets/widget.dart';
import 'package:http/http.dart' as http;


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  bool isLoading = false;

  List<CategoriesModel> categories = [];

  List<WallpaperModel> wallpapers = [];

  TextEditingController searchController = new TextEditingController();

  int noOfImageToLoad = 15;

  getTrendingWallpapers() async {

    setState(() {
      isLoading = true;
    });

    var response = await http.get(
        Uri.parse('https://api.pexels.com/v1/curated?per_page=250&page=1'),
        headers: {"Authorization": apiKey});
    //print(response.body.toString());

    Map<String, dynamic> jsonData = jsonDecode(response.body);
    //print(jsonData['photos']);

    jsonData['photos'].forEach((element) {
      //print(element);
      WallpaperModel wallpaperModel = WallpaperModel.fromMap(element);
      wallpapers.add(wallpaperModel);
    });

    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    categories = getCategories();
    getTrendingWallpapers();
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
              Container(
                decoration: BoxDecoration(
                  color: Color(0xfff5f8fd),
                  borderRadius: BorderRadius.circular(30),
                ),
                margin: EdgeInsets.symmetric(horizontal: 24),
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: searchController,
                        decoration: InputDecoration(
                          hintText: 'Search wallpaper',
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Search(
                                        searchQuery: searchController.text,
                                      )));
                        },
                        child: Container(child: Icon(Icons.search))),
                  ],
                ),
              ),
              SizedBox(height: 16),
              Container(
                height: 50,
                child: ListView.builder(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: (){
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Category(categoryName: categories[index].categoryName,imgUrl: categories[index].imgUrl,)));
                      },
                      child: CategoriesTile(
                          imgUrl: categories[index].imgUrl,
                          title: categories[index].categoryName),
                    );
                  },
                ),
              ),
              SizedBox(height: 16),
              isLoading ? Loading() : wallpapersList(wallpapers, context),
              SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}

class CategoriesTile extends StatelessWidget {
  late final String imgUrl, title;
  CategoriesTile({required this.imgUrl, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 6),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image(
              image: CachedNetworkImageProvider(imgUrl),
              height: 50,
              width: 100,
              fit: BoxFit.cover,
            )
          ),
          Container(
            height: 50,
            width: 100,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.black26,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          )
        ],
      ),
    );
  }
}
