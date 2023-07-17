import 'package:audioplayers/audioplayers.dart';
import 'package:get/instance_manager.dart';
import 'package:smartbin_ui_flutter/core/sound.dart';

class RootBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AudioPlayer());
    Get.lazyPut(() => PlaySound());
  }
}
