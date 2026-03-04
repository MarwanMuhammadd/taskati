import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:taskati/core/constant/app_fonts.dart';
import 'package:taskati/core/styles/app_colors.dart';
import 'package:taskati/core/styles/text_styles.dart';

class AppThemes {
  static ThemeData get light => ThemeData(
    iconTheme: IconThemeData(color: AppColors.blackColor),
    timePickerTheme: TimePickerThemeData(),
    datePickerTheme: DatePickerThemeData(
      backgroundColor: AppColors.backgroundColor,
    ),

    cardColor: AppColors.backgroundColor,
    fontFamily: AppFonts.lexendDeca,
    scaffoldBackgroundColor: Colors.transparent,
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        padding: const EdgeInsets.all(0),
        minimumSize: Size.zero,
        foregroundColor: AppColors.primaryColor,
      ),
    ),
    dividerColor: Colors.transparent,
    dividerTheme: DividerThemeData(color: AppColors.secondaryColor),
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.transparent,
      centerTitle: true,
      surfaceTintColor: Colors.transparent,
      systemOverlayStyle: SystemUiOverlayStyle.dark,
      titleTextStyle: TextStyles.title.copyWith(
        color: AppColors.blackColor,
        fontFamily: AppFonts.lexendDeca,
      ),
    ),
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.primaryColor,
      onSurface: AppColors.blackColor,
    ),
    inputDecorationTheme: InputDecorationTheme(
      fillColor: AppColors.backgroundColor,
      filled: true,
      hintStyle: TextStyles.caption1.copyWith(color: Colors.black),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: BorderSide.none,
      ),
    ),
  );
  static ThemeData get dark => ThemeData(
    timePickerTheme: TimePickerThemeData(
      backgroundColor: AppColors.blackColor,
      dialBackgroundColor: AppColors.secondaryColor,
    ),

    datePickerTheme: DatePickerThemeData(
      headerForegroundColor: AppColors.primaryColor,
      backgroundColor: AppColors.blackColor,
    ),
    iconTheme: IconThemeData(color: AppColors.backgroundColor),
    cardColor: AppColors.blackColor,
    fontFamily: AppFonts.lexendDeca,
    scaffoldBackgroundColor: Colors.transparent,
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        padding: const EdgeInsets.all(0),
        minimumSize: Size.zero,
        foregroundColor: AppColors.primaryColor,
      ),
    ),
    dividerColor: Colors.transparent,
    dividerTheme: DividerThemeData(color: AppColors.secondaryColor),
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.transparent,
      centerTitle: true,
      surfaceTintColor: Colors.transparent,
      systemOverlayStyle: SystemUiOverlayStyle.light,
      titleTextStyle: TextStyles.title.copyWith(
        color: AppColors.backgroundColor,
        fontFamily: AppFonts.lexendDeca,
      ),
    ),
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.primaryColor,
      onSurface: AppColors.backgroundColor,
    ),
    inputDecorationTheme: InputDecorationTheme(
      fillColor: AppColors.blackColor,
      filled: true,
      hintStyle: TextStyles.caption1.copyWith(color: Colors.white),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: BorderSide.none,
      ),
    ),
  );
}
