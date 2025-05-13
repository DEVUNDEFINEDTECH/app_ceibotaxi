import 'package:get/get.dart';
import 'package:audioplayers/audioplayers.dart';

class HomeController extends GetxController {
  RxBool modalOpen = false.obs;
  final AudioPlayer player = AudioPlayer();
  var isPlaying = false.obs;

  Future<void> playAudioFromUrl(String audioUrl) async {
    await player.play(UrlSource(audioUrl));
    isPlaying.value = true;
  }

  Future<void> stopAudio() async {
    await player.stop();
    isPlaying.value = false;
  }

  Future<void> toggleAudio(String audioUrl) async {
    if (isPlaying.value) {
      await stopAudio();
    } else {
      await playAudioFromUrl(audioUrl);
    }
  }

  @override
  void onClose() {
    player.dispose(); // Importante para liberar recursos
    super.onClose();
  }
}
