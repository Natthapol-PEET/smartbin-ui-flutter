import 'package:get/get.dart';
import 'package:smartbin_ui_flutter/apis/smartbin_api.dart';
import 'package:smartbin_ui_flutter/core/controller_base.dart';
import 'package:smartbin_ui_flutter/core/router.dart';
import 'package:smartbin_ui_flutter/models/waste_model.dart';
import 'package:smartbin_ui_flutter/widgets/dialog.dart';

class HomeController extends BaseController {
  SmartBinApi api = Get.find<SmartBinApi>();

  RxDouble can = 0.0.obs;
  RxDouble pet = 0.0.obs;
  RxDouble plastic = 0.0.obs;

  @override
  void onInit() {
    super.onInit();
    initHomeScreen();
  }

  initHomeScreen() async {
    try {
      Response resp = await api.getAmountWaste();

      if (resp.isOk) {
        WasteModel model = WasteModel.fromJson(resp.body);
        can.value = model.data?.can as double;
        pet.value = model.data?.pet as double;
        plastic.value = model.data?.plastic as double;
      } else {
        SmartBinDialog.showWarning(desc: 'ไม่สามารถดึงข้อมูลความจุขยะปัจจุบันได้', onOk: () {});
      }
    } catch (e) {
      SmartBinDialog.showWarning(desc: 'ไม่สามารถดึงข้อมูลความจุขยะปัจจุบันได้', onOk: () {});
    }
  }

  goToExchange() {
    if (can.value == 100 || pet.value == 100 || plastic.value == 100) {
      SmartBinDialog.showWarning(desc: 'ถังขยะเต็ม กรุณาทำรายการในภายหลัง', onOk: () {});
    } else {
      Get.find<SmartBinApi>().playSound(command: 'main.exchange');
      Get.toNamed(RoutePath.savingDonate);
    }
  }
}
