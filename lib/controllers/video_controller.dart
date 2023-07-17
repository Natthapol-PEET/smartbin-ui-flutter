import 'package:get/get.dart';
import 'package:smartbin_ui_flutter/core/video.dart';
import 'package:video_player/video_player.dart';

class VideoController extends GetxController {
  VideoPlayerController? videoController;

  @override
  void onInit() {
    super.onInit();
    videoController = VideoPlayerController.asset(SuorceVideo.vbin)
      ..initialize().then((value) {
        update();
        videoController?.play();
      });
  }

  @override
  void onClose() {
    super.onClose();
    videoController?.dispose();
  }
}
