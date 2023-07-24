import 'package:get/get.dart';
import 'package:smartbin_ui_flutter/controllers/user_select_type_controller.dart';

class UserSelectTypeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => UserSelectTypeController());
  }
}
