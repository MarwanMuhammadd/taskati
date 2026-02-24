import 'package:flutter/material.dart';
import 'package:taskati/core/styles/app_colors.dart';
import 'package:taskati/core/styles/text_styles.dart';

class TabButton extends StatelessWidget {
  const TabButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.bgColor = AppColors.accentprimaryColor,
    this.height = 30,
    this.width = 70,
    this.textStyle,
  });
  final String text;
  final Function() onPressed;
  final Color bgColor;
  final double height;
  final double width;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: bgColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        minimumSize: Size(width, height),
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style:
            textStyle ??
            TextStyles.caption1.copyWith(
              color: AppColors.primaryColor,
              fontWeight: FontWeight.w600,
            ),
      ),
    );
  }
}
