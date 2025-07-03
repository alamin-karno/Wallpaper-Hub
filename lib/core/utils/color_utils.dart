import 'package:flutter/material.dart';

class ColorUtils {
  static Color hexToColor(String hex) {
    hex = hex.replaceFirst('#', '');
    if (hex.length == 6) {
      hex = 'FF$hex'; // add opacity if missing
    }
    return Color(int.parse(hex, radix: 16));
  }
}
