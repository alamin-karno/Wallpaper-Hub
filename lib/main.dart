import 'package:flutter/material.dart';
import 'package:wallpaper_hub/features/home/presentation/ui/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Wallpaper Hub',
      theme: ThemeData(primaryColor: Colors.white),
      home: HomePage(),
    );
  }
}
