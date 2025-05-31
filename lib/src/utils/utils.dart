import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:permission_handler/permission_handler.dart';

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
  await flutterTts.setPitch(0.5);
  await flutterTts.speak(text);
  print("Text to Speech: $text");
}

final player = AudioPlayer();

Future<void> playAudioFromUrl(String audio) async {
  // const audioUrl =
  //     'https://drive.google.com/uc?export=download&id=131V0HDgn9i3SXsGBHtXDIhIeKW2lRkae';
  await player.play(UrlSource(audio));
}
// void showToast(String message) {
//   EasyLoading.showToast(
//     message,
//     toastPosition: EasyLoadingToastPosition.bottom,
//     dismissOnTap: true,
//   );
// }

void mostrarError(BuildContext context, String mensaje) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(mensaje),
      backgroundColor: Colors.red,
    ),
  );
}

Future<void> call(BuildContext context, String numero) async {
  try {
    numero = numero.replaceAll(RegExp(r'\s|-'), '');
    final Uri uri = Uri(scheme: 'tel', path: numero);

    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      mostrarError(context, 'No se pudo iniciar la llamada.');
    }
  } catch (e) {
    mostrarError(context, 'Error al intentar llamar: $e');
  }
}

Future<void> openWhatsApp(BuildContext context, String numero) async {
  try {
    numero = numero.replaceAll(RegExp(r'\s|-'), '');
    if (numero.startsWith('0')) {
      numero = numero.substring(1);
    }
    const codigoPais = '593'; // Ecuador
    final numeroIntl = '$codigoPais$numero';
    final Uri url = Uri.parse('https://wa.me/$numeroIntl');

    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    } else {
      mostrarError(context, 'No se pudo abrir WhatsApp.');
    }
  } catch (e) {
    mostrarError(context, 'Error al abrir WhatsApp: $e');
  }
}
