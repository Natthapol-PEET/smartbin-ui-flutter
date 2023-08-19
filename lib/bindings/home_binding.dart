import 'package:get/get.dart';
import 'package:smartbin_ui_flutter/controllers/home_controller.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
  }
}
