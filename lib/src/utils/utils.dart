import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

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

Future<void> textToSpeech(String text) async {
  if (text.isEmpty) {
    return;
  }
  FlutterTts flutterTts = FlutterTts();

  await flutterTts.setLanguage('es-EC');
  await flutterTts.setPitch(1.0);
  await flutterTts.speak(text);
  print("Text to Speech: $text");
}
// void showToast(String message) {
//   EasyLoading.showToast(
//     message,
//     toastPosition: EasyLoadingToastPosition.bottom,
//     dismissOnTap: true,
//   );
// }
