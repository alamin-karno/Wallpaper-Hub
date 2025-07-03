import 'package:flutter/material.dart';
import 'package:wallpaper_hub/core/utils/color_utils.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({
    super.key,
    this.height = 45,
    this.width = 45,
    required this.icon,
    this.color = '36FFFFFF',
    this.onPressed,
  });

  final double height;
  final double width;
  final IconData icon;
  final String color;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white54, width: 1),
          borderRadius: BorderRadius.circular(12),
          gradient: LinearGradient(
            colors: [
              ColorUtils.hexToColor(color).withValues(alpha: 0.6),
              ColorUtils.hexToColor(color).withValues(alpha: 0.3),
            ],
          ),
        ),
        padding: EdgeInsets.all(8),
        child: Icon(
          icon,
          color: Colors.white,
          size: 18,
        ),
      ),
    );
  }
}
