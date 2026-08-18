import 'package:flutter/material.dart';
import 'package:payment_karo/screens/SplashScreen.dart';

import 'constants/AppColors.dart';

void main() {
  runApp(const PaymentkroApp());
}

class PaymentkroApp extends StatelessWidget {
  const PaymentkroApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Paymentkro',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        scaffoldBackgroundColor: AppColors.background,
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.red,
          brightness: Brightness.dark,
          primary: AppColors.red,
          secondary: AppColors.white,
          surface: AppColors.surfaceBlack,
        ),
        fontFamily: 'Poppins', // remove if you haven't added Poppins to pubspec.yaml
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.background,
          foregroundColor: AppColors.white,
          elevation: 0,
        ),
        textSelectionTheme: const TextSelectionThemeData(
          cursorColor: AppColors.red,
          selectionColor: AppColors.red,
          selectionHandleColor: AppColors.red,
        ),
      ),
      home: const SplashScreen(),
    );
  }
}