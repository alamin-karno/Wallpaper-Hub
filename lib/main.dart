import 'package:flutter/material.dart';
import 'package:wallpaper_hub/screens/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Wallpaper Hub',
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      home: Home(),
    );
  }
}

