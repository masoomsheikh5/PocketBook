import 'package:flutter/material.dart';
class CustomButton extends StatelessWidget {
  final String title;
  final Color color;
  final double radius;
  final double width;
  final double height;
  final VoidCallback onPressed;
  final double fontSize;
  final Color textColor;

  CustomButton({
    required this.title,
    required this.color,
    required this.radius,
    required this.width,
    required this.height,
    required this.onPressed,
    required this.fontSize,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(radius),
        ),
        width: width,
        height: height,
        alignment: Alignment.center,
        child: Text(
          title,
          style: TextStyle(
            color: textColor,
            fontSize: fontSize,
          ),
        ),
      ),
    );
  }
}