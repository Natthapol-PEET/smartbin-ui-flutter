import 'package:audioplayers/audioplayers.dart';
import 'package:get/get.dart';

class SourceSound {
  static String gun = 'assets/sounds/gun.mp3';
}

class PlaySound {
  final player = Get.find<AudioPlayer>();

  void on(String source) async {
    await player.play(UrlSource(source));
  }
}
