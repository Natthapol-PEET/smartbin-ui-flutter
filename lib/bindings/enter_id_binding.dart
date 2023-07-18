import 'package:get/get.dart';
import 'package:smartbin_ui_flutter/controllers/enter_id_controller.dart';

class EnterIDBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => EnterIDController());
  }
}
