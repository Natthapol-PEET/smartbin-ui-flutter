import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:get/get.dart';

class SmartBinDialog {
  static void showWarning({required String desc, void Function()? onOk}) {
    AwesomeDialog(
      context: Get.context!,
      width: 400,
      dialogType: DialogType.warning,
      animType: AnimType.rightSlide,
      title: 'แจ้งเตือน',
      desc: desc,
      btnOkOnPress: onOk,
      btnCancelOnPress: null,
    ).show();
  }

  static void showError({required String desc, void Function()? onOk}) {
    AwesomeDialog(
      context: Get.context!,
      width: 400,
      dialogType: DialogType.error,
      animType: AnimType.rightSlide,
      title: 'แจ้งเตือน',
      desc: desc,
      btnOkOnPress: onOk,
      btnCancelOnPress: null,
    ).show();
  }
}
