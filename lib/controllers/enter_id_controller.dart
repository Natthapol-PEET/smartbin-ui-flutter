import 'package:get/get.dart';
import 'package:smartbin_ui_flutter/core/controller_base.dart';
import 'package:smartbin_ui_flutter/core/router.dart';

class EnterIDController extends BaseController {
  RxString studentId = ''.obs;

  void gotoProcess() {
    if (studentId.value.length < 10) return;

    Get.offAllNamed(RoutePath.process, arguments: studentId.value);
  }

  void addDigit(String digit) {
    if (studentId.value.length == 10) return;

    studentId.value += digit;
  }

  void clear() => studentId.value = '';
}
