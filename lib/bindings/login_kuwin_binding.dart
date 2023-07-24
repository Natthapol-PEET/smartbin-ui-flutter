import 'package:get/get.dart';
import 'package:smartbin_ui_flutter/controllers/login_kuwin_controller.dart';

class LoginKuwinBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginKuwinController());
  }
}
