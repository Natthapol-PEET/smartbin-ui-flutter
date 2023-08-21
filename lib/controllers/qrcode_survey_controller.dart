import 'dart:async';
import 'package:get/get.dart';
import 'package:smartbin_ui_flutter/apis/smartbin_api.dart';
import 'package:smartbin_ui_flutter/core/router.dart';

class QrCodeSurveyController extends GetxController {
  Timer? _timer;

  @override
  void onInit() {
    super.onInit();

    Get.find<SmartBinApi>().playSound(command: 'all.thanks');

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
