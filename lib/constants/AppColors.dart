import 'package:flutter/material.dart';

/// Paymentkro brand palette — Black / White / Red
class AppColors {
  AppColors._();

  static const Color black = Color(0xFF000000);
  static const Color background = Color(0xFF0A0A0A);
  static const Color surfaceBlack = Color(0xFF1A1A1A);
  static const Color surfaceBlack2 = Color(0xFF242424);
  static const Color red = Color(0xFFE0142A);
  static const Color redDark = Color(0xFFB3101F);
  static const Color white = Color(0xFFFFFFFF);
  static const Color offWhite = Color(0xFFF5F5F5);
  static const Color grey = Color(0xFF9A9A9A);
  static const Color border = Color(0xFF2E2E2E);
}

class AppTextStyles {
  AppTextStyles._();

  static const String fontFamily = 'Poppins'; // add Poppins to pubspec if desired

  static const TextStyle heading = TextStyle(
    fontFamily: fontFamily,
    fontSize: 26,
    fontWeight: FontWeight.w700,
    color: AppColors.white,
  );

  static const TextStyle subHeading = TextStyle(
    fontFamily: fontFamily,
    fontSize: 15,
    fontWeight: FontWeight.w400,
    color: AppColors.grey,
  );

  static const TextStyle button = TextStyle(
    fontFamily: fontFamily,
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: AppColors.white,
  );
}