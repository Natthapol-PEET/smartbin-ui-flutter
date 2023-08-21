import 'dart:async';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:get/get.dart';
import 'package:smartbin_ui_flutter/apis/smartbin_api.dart';
import 'package:smartbin_ui_flutter/core/controller_base.dart';
import 'package:smartbin_ui_flutter/core/router.dart';
import 'package:smartbin_ui_flutter/models/access_token_model.dart';
import 'package:smartbin_ui_flutter/widgets/dialog.dart';

class ScanQRCodeController extends BaseController {
  SmartBinApi api = Get.find<SmartBinApi>();

  int get timeout => 15;
  RxInt count = 0.obs;
  Timer? timer;

  RxBool showQrCode = true.obs;

  @override
  void onInit() {
    super.onInit();

    count = timeout.obs;
    timer = Timer.periodic(const Duration(seconds: 1), (_) {
      count--;

      if (count.value % 5 == 0) {
        getQrCodeLogin();
      }

      if (count.value < 0) {
        count.value = timeout;
        showQrCode(false);
        clearCache();
        Timer(const Duration(microseconds: 100), () => showQrCode(true));
      }
    });
  }

  Future<void> clearCache() async {
    await CachedNetworkImage.evictFromCache('http://localhost:8080/api/v1/smartbin/login_qrcode');
  }

  Future<void> getQrCodeLogin() async {
    try {
      Response resp = await api.getQrCodeAccessToken();

      if (resp.isOk) {
        AccessTokenModel data = AccessTokenModel.fromJson(resp.body);
        Get.offAllNamed(RoutePath.process, arguments: {
          'display': 'ผู้ใช้งานผ่าน Mobile',
          'token': data,
        });
      }
    } catch (e) {
      SmartBinDialog.showError(
        desc: 'ระบบมีปัญหา กรุณาลองใหม่ภายหลัง',
        onOk: () => Get.offAllNamed(RoutePath.home),
      );
    }
  }

  @override
  void onClose() {
    super.onClose();
    timer?.cancel();
  }
}
