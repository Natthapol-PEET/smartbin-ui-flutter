import 'package:get/get.dart';
import 'package:smartbin_ui_flutter/controllers/total_point_controller.dart';

class TotalPointBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TotalPointController());
  }
}
