import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:wallpaper_hub/data/data.dart';
import 'package:wallpaper_hub/model/wallpaper_model.dart';
import 'package:wallpaper_hub/screens/loading.dart';
import 'package:wallpaper_hub/widgets/widget.dart';
import 'package:http/http.dart' as http;

class Search extends StatefulWidget {

  final String searchQuery;
  Search({required this.searchQuery});

  @override
  _SearchState createState() => _SearchState();

}

class _SearchState extends State<Search> {

  bool isLoading = false;

  List<WallpaperModel> wallpapers = [];
  TextEditingController searchController = new TextEditingController();

  _getSearchWallpapers(String query) async {

    setState(() {
      isLoading = true;
    });

    wallpapers = [];
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
    _getSearchWallpapers(widget.searchQuery);
    super.initState();
    searchController.text = widget.searchQuery;
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
                          hintText: 'search wallpaper',
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    GestureDetector(
                        onTap: () {
                          _getSearchWallpapers(searchController.text);
                        },
                        child: Container(child: Icon(Icons.search))),
                  ],
                ),
                
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
