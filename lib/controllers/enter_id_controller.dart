import 'package:get/get.dart';
import 'package:smartbin_ui_flutter/apis/smartbin_api.dart';
import 'package:smartbin_ui_flutter/core/controller_base.dart';
import 'package:smartbin_ui_flutter/core/router.dart';
import 'package:smartbin_ui_flutter/models/access_token_model.dart';
import 'package:smartbin_ui_flutter/widgets/dialog.dart';

class EnterIDController extends BaseController {
  SmartBinApi api = Get.find<SmartBinApi>();

  RxString studentId = ''.obs;

  void gotoProcess() async {
    if (studentId.value.length < 10) {
      SmartBinDialog.showWarning(
        desc: 'กรุณากรอกรหัสนิสิตให้ครบถ้วน',
        onOk: () {},
      );
      return;
    }

    try {
      Response resp = await api.loginByStudentId(studentId.value);

      if (resp.isOk) {
        AccessTokenModel data = AccessTokenModel.fromJson(resp.body);

        Get.offAllNamed(RoutePath.process, arguments: {
          'display': studentId.value,
          'token': data,
        });
      } else {
        SmartBinDialog.showWarning(
          desc: 'ระบบมีปัญหา กรุณาลองใหม่ภายหลัง',
          onOk: () => Get.offAllNamed(RoutePath.home),
        );
      }
    } catch (e) {
      SmartBinDialog.showError(
        desc: 'ระบบมีปัญหา กรุณาลองใหม่ภายหลัง',
        onOk: () => Get.offAllNamed(RoutePath.home),
      );
    }
  }

  void addDigit(String digit) {
    if (studentId.value.length == 10) return;

    studentId.value += digit;
  }

  void clear() => studentId.value = '';
}
