import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ColorsApp {
  static const green = Color(0xFF009538);
  static const lightGreen = Color(0xFF3cc585);
}

final lightTheme = ThemeData(
    useMaterial3: true,
    textTheme: GoogleFonts.robotoTextTheme(),
    fontFamily: GoogleFonts.roboto().fontFamily,
    // colorScheme: const ColorScheme(
    //     primary: ColorsApp.green,
    //     secondary: ColorsApp.lightGreen,
    //     surface: ColorsApp.background,
    //     error: ColorsApp.red,
    //     onPrimary: ColorsApp.titles,
    //     onSecondary: ColorsApp.cyanStrong,
    //     onSurface: Color(0xff5F6368),
    //     onPrimaryContainer: Color(0xff0080F6),
    //     onSecondaryContainer: ColorsApp.lightGreen,
    //     onInverseSurface: ColorsApp.success,
    //     onError: ColorsApp.red,
    //     brightness: Brightness.light),
    colorScheme: ColorScheme.fromSeed(seedColor: ColorsApp.green));
