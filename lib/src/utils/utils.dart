import 'package:flutter/material.dart';
//import 'package:flutter_easyloading/flutter_easyloading.dart';

String capitalize(String s) => s[0].toUpperCase() + s.substring(1);

double heightAppBar = 70;
double heightAppBar360w = 50;
double sizeIcons = 27;
double sizeIcons360w = 23;

const double paddingHorizontal = 18.5;

//hexadecimal color
Color colorBackInput = const Color(0xffEAEBFA);

String valorParseado(double number) {
  // split the number into two parts
  final intPart = number.toInt();
  final doublePart = number - intPart;
  if (doublePart == 0.0) {
    return intPart.toString();
  }
  return number.toString();
}

// void showToast(String message) {
//   EasyLoading.showToast(
//     message,
//     toastPosition: EasyLoadingToastPosition.bottom,
//     dismissOnTap: true,
//   );
// }
