import 'dart:async';
import 'package:get/get.dart';
import 'package:smartbin_ui_flutter/core/router.dart';

class ThanksController extends GetxController {
  Timer? _timer;

  @override
  void onInit() {
    super.onInit();

    _timer = Timer(const Duration(seconds: 5), () {
      Get.offAllNamed(RoutePath.home);
    });
  }

  @override
  void onClose() {
    super.onClose();
    _timer?.cancel();
  }
}
