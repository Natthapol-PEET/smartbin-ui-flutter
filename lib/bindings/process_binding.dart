import 'package:get/get.dart';
import 'package:smartbin_ui_flutter/controllers/process_controller.dart';

class ProcessBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ProcessController());
  }
}
