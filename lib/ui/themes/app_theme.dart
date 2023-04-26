import 'package:flutter/material.dart';
import 'constants.dart';

var primaryColor = const Color(0xffF8F8F8);
var secondaryColor = const Color(0xff06A3D6);
var accentColor = const Color(0xff014A96);
var hintsClr = const Color.fromRGBO(21, 22, 36, .4);
var pureWhite = const Color.fromRGBO(255, 255, 255, 1);

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: primaryColor,
  primaryColorDark: pureWhite,
  textTheme: getTextTheme(),
);

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: pureWhite,
  primaryColorDark: primaryColor,
  textTheme: getTextTheme(),
);

TextTheme getTextTheme() {
  return const TextTheme(
    /// extraBold 24
    displayLarge: TextStyle(
      fontFamily: Lora,
      fontSize: 24,
      fontWeight: FontWeight.w800,
    ),

    /// bold 24
    displayMedium:
        TextStyle(fontFamily: Lora, fontSize: 24, fontWeight: FontWeight.bold),

    /// regular 20
    displaySmall: TextStyle(
      fontFamily: Lora,
      fontSize: 20,
      fontWeight: FontWeight.w500,
    ),

    /// bold 20
    headlineLarge: TextStyle(
      fontFamily: Lora,
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),

    /// bold 18
    headlineMedium: TextStyle(
      fontFamily: Lora,
      fontSize: 18,
      fontWeight: FontWeight.bold,
    ),

    /// regular 16
    headlineSmall: TextStyle(
      fontFamily: Lora,
      fontSize: 16,
      fontWeight: FontWeight.w500,
    ),

    /// bold 16
    titleLarge: TextStyle(
      fontFamily: Lora,
      fontSize: 16,
      fontWeight: FontWeight.bold,
    ),

    /// extraBold 16
    bodyLarge: TextStyle(
      fontFamily: Lora,
      fontSize: 16,
      fontWeight: FontWeight.w800,
    ),

    /// regular 12
    titleMedium: TextStyle(
      fontFamily: Lora,
      fontSize: 12,
      fontWeight: FontWeight.w500,
    ),

    /// light 12
    titleSmall: TextStyle(
      fontFamily: Lora,
      fontSize: 12,
      fontWeight: FontWeight.w300,
    ),

    /// bold 12
    labelLarge: TextStyle(
      fontFamily: Lora,
      fontSize: 12,
      fontWeight: FontWeight.bold,
    ),

    /// bold 10
    labelMedium: TextStyle(
      fontFamily: Lora,
      fontSize: 10,
      fontWeight: FontWeight.bold,
    ),

    /// regular 8
    labelSmall: TextStyle(
      fontFamily: Lora,
      fontSize: 8,
      fontWeight: FontWeight.w300,
    ),
  );
}
