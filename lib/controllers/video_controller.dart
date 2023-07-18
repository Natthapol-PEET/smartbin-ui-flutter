import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class VideoController extends GetxController {
  VideoPlayerController? videoController;

  @override
  void onInit() {
    super.onInit();

    // videoController = VideoPlayerController.asset(SourceVideo.vbin)
    //   ..initialize().then((_) {
    //     update();
    //     Timer(const Duration(seconds: 3), () {
    //       videoController?.play();
    //     });
    //   });

    videoController = VideoPlayerController.networkUrl(Uri.parse(
        'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4'))
      ..initialize().then((_) {
        update();
      });
  }

  @override
  void onClose() {
    super.onClose();
    videoController?.dispose();
  }
}
