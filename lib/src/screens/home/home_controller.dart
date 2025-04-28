import 'package:get/get.dart';

class HomeController extends GetxController {
  RxBool modalOpen = false.obs;
}

Future<void> textToSpeech(String text) async {
  if (text.isEmpty) {
    return;
  }
  // Implement your text-to-speech logic here
  print("Text to Speech: $text");
}
