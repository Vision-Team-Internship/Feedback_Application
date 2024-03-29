// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class ThemeConstant {
  static final light = ThemeData(
    scaffoldBackgroundColor: Color(0xFFFFFFFF),
    primaryColorLight: Colors.white,
    brightness: Brightness.light,
    appBarTheme: AppBarTheme(
      elevation: 0.1,
      backgroundColor: Colors.white,
    ),
  );

  static final dark = ThemeData(
    scaffoldBackgroundColor: Color(0xFF000000),
     primaryColorLight: Colors.black,
    brightness: Brightness.dark,
    appBarTheme: AppBarTheme(
      elevation: 0.1,
      backgroundColor: Colors.black,
    ), 
  );

  static const ColorScheme lightScheme = ColorScheme(
    primary: Color(0xFF0080FF),
    primaryVariant: Color(0xFFF1F3F4),
    secondary: Color(0xFF6B6767),
    secondaryVariant: Color(0xFFBFBFBF),
    background: Color(0xFFFFFFFF),
    surface: Color(0xFFFF0000),
    error: Color(0xFFB00020),
    onPrimary: Color(0xFFFFFFFF),
    onSecondary: Color(0xFF000000),
    onBackground: Color(0xFF000000),
    onSurface: Color(0xFFFFFFFF),
    onError: Color(0xFFFFFFFF),
    brightness: Brightness.light,
  );

  static TextTheme get textTheme => const TextTheme(
        headline1: TextStyle(
          fontSize: 93,
          fontWeight: FontWeight.w300,
          fontFamily: 'Poppins',
          letterSpacing: -1.5,
        ),
        headline2: TextStyle(
          fontSize: 58,
          fontWeight: FontWeight.w300,
          letterSpacing: -0.5,
          fontFamily: 'Poppins',
        ),
        headline3: TextStyle(
          fontSize: 46,
          fontWeight: FontWeight.w400,
          fontFamily: 'Poppins',
          // backgroundColor: Colors.blue,
        ),
        headline4: TextStyle(
          fontSize: 33,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.25,
          fontFamily: 'Poppins',
        ),
        headline5: TextStyle(
          fontSize: 23,
          fontWeight: FontWeight.w400,
          fontFamily: 'Poppins',
        ),
        headline6: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.15,
          fontFamily: 'Poppins',
        ),
        subtitle1: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.15,
          fontFamily: 'Poppins',
        ),
        subtitle2: TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.1,
          fontFamily: 'Poppins',
        ),
        bodyText1: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.5,
          fontFamily: 'Poppins',
        ),
        bodyText2: TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.25,
          fontFamily: 'Poppins',
        ),
        button: TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w500,
          letterSpacing: 1.25,
          fontFamily: 'Poppins',
        ),
        caption: TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.4,
          fontFamily: 'Poppins',
        ),
        overline: TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.w400,
          letterSpacing: 1.5,
          fontFamily: 'Poppins',
        ),
      ).apply(
        displayColor: lightScheme.onSurface,
        bodyColor: lightScheme.onSurface,
        decorationColor: lightScheme.onSurface,
      );
}
