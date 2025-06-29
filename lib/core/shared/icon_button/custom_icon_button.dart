import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({
    super.key,
    this.height = 45,
    this.width = 42,
    required this.icon,
    this.onPressed,
  });

  final double height;
  final double width;
  final IconData icon;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            height: height,
            width: width,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white54, width: 1),
              borderRadius: BorderRadius.circular(12),
              gradient: LinearGradient(
                colors: [
                  Color(0x36FFFFFF),
                  Color(0x0FFFFFFF),
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
        ],
      ),
    );
  }
}
