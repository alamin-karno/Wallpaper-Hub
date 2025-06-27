import 'package:flutter/material.dart';

class AppNameWidget extends StatelessWidget {
  const AppNameWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
        children: <TextSpan>[
          TextSpan(text: 'Wallpaper', style: TextStyle(color: Colors.black87)),
          TextSpan(text: 'Hub', style: TextStyle(color: Colors.blue)),
        ],
      ),
    );
  }
}
