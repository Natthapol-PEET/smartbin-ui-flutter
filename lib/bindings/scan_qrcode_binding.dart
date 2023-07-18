import 'package:get/get.dart';
import 'package:smartbin_ui_flutter/controllers/scan_qrcode_controller.dart';

class ScanQrCodeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ScanQRCodeController());
  }
}
