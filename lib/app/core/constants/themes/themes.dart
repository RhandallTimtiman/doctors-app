import 'package:consumer_app/app/core/constants/themes/app_theme_colors.dart';
import 'package:consumer_app/app/data/interfaces/interface.dart';
import 'package:flutter/material.dart';

class AppTheme {
  ThemeData light = _theme(LightColors());
  ThemeData dark = _theme(DarkColors());
}

ThemeData _theme(ThemeColors color) => ThemeData.light().copyWith(
      primaryColor: color.primary,
      scaffoldBackgroundColor: color.mainBackground,
      backgroundColor: color.mainBackground,
      textTheme: const TextTheme().copyWith(
        headline6: TextStyle(
          color: color.primary,
          fontSize: 32,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.bold,
        ),
        headline5: const TextStyle(
          fontSize: 28,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.bold,
        ),
        headline4: const TextStyle(
          fontSize: 24,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.bold,
        ),
        headline3: const TextStyle(
          fontSize: 20,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.bold,
        ),
        headline2: const TextStyle(
          fontSize: 18,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
        headline1: const TextStyle(
          fontSize: 16,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.bold,
        ),
        bodyText1: const TextStyle(
          fontSize: 14,
          fontFamily: 'Poppins',
          color: Colors.black,
        ),
        bodyText2: const TextStyle(
          fontSize: 12,
          fontFamily: 'Poppins',
          color: Colors.black,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
            color.primary,
          ),
        ),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: color.background,
      ),
    );
