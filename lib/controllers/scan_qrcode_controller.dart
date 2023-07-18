import 'dart:async';
import 'package:get/get.dart';
import 'package:smartbin_ui_flutter/core/controller_base.dart';

class ScanQRCodeController extends BaseController {
  RxInt count = 60.obs;
  Timer? timer;

  @override
  void onInit() {
    super.onInit();

    timer = Timer.periodic(const Duration(seconds: 1), (_) {
      count--;

      if (count.value < 0) {
        count.value = 60;
      }
    });
  }

  @override
  void onClose() {
    super.onClose();
    timer?.cancel();
  }
}
