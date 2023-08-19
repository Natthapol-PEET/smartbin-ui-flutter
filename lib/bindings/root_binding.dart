import 'package:get/instance_manager.dart';
import 'package:smartbin_ui_flutter/apis/smartbin_api.dart';

class RootBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SmartBinApi(), fenix: true);
  }
}
