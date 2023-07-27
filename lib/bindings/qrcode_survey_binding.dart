import 'package:get/get.dart';
import 'package:smartbin_ui_flutter/controllers/qrcode_survey_controller.dart';

class QrCodeSurveyBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(QrCodeSurveyController());
  }
}
