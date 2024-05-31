import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ColorsApp {
  static const green = Color(0xFF009538);
  static const lightGreen = Color(0xFF3cc585);
  static const blue = Color(0xff375E97);
  static const cyanStrong = Color(0xff375E97);
  static const cyan = Color(0xFF4AF3F8);
  static const grey = Color(0xff212738);
  static const lightGrey = Color(0xffbbbbbb);
  static const veryLigGray = Color(0xfff3f3f3);
  static const white = Color(0xffffffff);
  static const black = Color(0xff000000);
  static const red = Color(0xffFF0C0C);
  static const yellow = Color(0xffffbb00);
  static const hintText = Color(0xff9e9e9e);
  static const background = Color(0xffF5F8FA);
  static const titles = Color(0xff333333);
  static const success = Color(0xff375E97);
}

// final gradiantColors = [ColorsApp.green, ColorsApp.yellow];
// final gradiantColorsR = [ColorsApp.blue, ColorsApp.dark];

final lightTheme = ThemeData(
  textTheme: GoogleFonts.robotoTextTheme(),
  fontFamily: GoogleFonts.roboto().fontFamily,
  colorScheme: const ColorScheme(
      primary: ColorsApp.lightGreen,
      primaryContainer: ColorsApp.blue,
      secondary: ColorsApp.cyanStrong,
      secondaryContainer: ColorsApp.cyan,
      surface: Color(0XFFFFFFFF),
      background: ColorsApp.background,
      error: ColorsApp.red,
      onPrimary: ColorsApp.titles,
      onSecondary: ColorsApp.cyanStrong,
      onSurface: Color(0xff5F6368),
      onBackground: ColorsApp.lightGrey,
      onPrimaryContainer: Color(0xff0080F6),
      onSecondaryContainer: ColorsApp.cyan,
      onInverseSurface: ColorsApp.success,
      onError: ColorsApp.red,
      brightness: Brightness.light),
);
