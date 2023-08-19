import 'package:get/get.dart';
import 'package:smartbin_ui_flutter/apis/smartbin_api.dart';
import 'package:smartbin_ui_flutter/core/controller_base.dart';
import 'package:smartbin_ui_flutter/models/waste_model.dart';

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
        WasteModel data = WasteModel.fromJson(resp.body);
        can.value = data.can as double;
        pet.value = data.pet as double;
        plastic.value = data.plastic as double;
      }
    } catch (e) {
      print(e);
    }
  }
}
