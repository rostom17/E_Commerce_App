import 'package:e_commerce_app/presentation/ui/utilities/app_color_theme.dart';
import 'package:flutter/material.dart';

ThemeData lightTheme() {
  return ThemeData(
      colorSchemeSeed: const Color(0xFF07ADAE),
      inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
          fillColor: Colors.green.withOpacity(.08),
          filled: true,
          hintStyle: const TextStyle(color: Colors.grey)),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
        backgroundColor: AppColorTheme.appColorTheme,
        fixedSize: const Size.fromWidth(double.maxFinite),
        padding: const EdgeInsets.symmetric(vertical: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      )),
      iconButtonTheme: IconButtonThemeData(
        style: IconButton.styleFrom(
          foregroundColor: Colors.grey.shade600,
        ),
      ),
      textTheme: const TextTheme(
        displayLarge: TextStyle(),
        displayMedium: TextStyle(),
        displaySmall: TextStyle(),
        headlineLarge: TextStyle(),
        headlineMedium: TextStyle(),
        headlineSmall: TextStyle(
            fontSize: 30, fontWeight: FontWeight.w700, color: Colors.black54),
        titleLarge: TextStyle(),
        titleMedium: TextStyle(),
        titleSmall: TextStyle(
            fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
        bodyLarge: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: AppColorTheme.appColorTheme),
        bodyMedium: TextStyle(
            fontSize: 14, fontWeight: FontWeight.w500, color: Colors.grey),
        bodySmall: TextStyle(),
      ));
}
