import 'package:get/get.dart';
import 'package:smartbin_ui_flutter/controllers/video_controller.dart';

class VideoBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => VideoController());
  }
}
