import 'package:get/instance_manager.dart';
import 'package:smartbin_ui_flutter/controllers/thanks_controller.dart';

class ThanksBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(ThanksController());
  }
}
