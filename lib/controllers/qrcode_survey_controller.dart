import 'dart:async';
import 'package:get/get.dart';
import 'package:smartbin_ui_flutter/core/router.dart';

class QrCodeSurveyController extends GetxController {
  Timer? _timer;

  @override
  void onInit() {
    super.onInit();

    _timer = Timer(const Duration(seconds: 10), () {
      Get.offAllNamed(RoutePath.thanks);
    });
  }

  @override
  void onClose() {
    super.onClose();
    _timer?.cancel();
  }
}
