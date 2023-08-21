import 'dart:async';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:smartbin_ui_flutter/apis/smartbin_api.dart';
import 'package:smartbin_ui_flutter/core/controller_base.dart';
import 'package:smartbin_ui_flutter/core/router.dart';
import 'package:smartbin_ui_flutter/models/access_token_model.dart';
import 'package:smartbin_ui_flutter/models/data_type_model.dart';
import 'package:smartbin_ui_flutter/models/prediction_type.dart';
import 'package:smartbin_ui_flutter/widgets/dialog.dart';

class ProcessController extends BaseController {
  SmartBinApi api = Get.find<SmartBinApi>();

  late DataTypeModel dataTypeModel;

  get arg => Get.arguments;
  AccessTokenModel? accessModel;
  String display = 'ผู้พิทักษ์โลก';

  RxInt point = 0.obs;
  Timer? timer;
  bool countdown = false;
  RxBool isReady = true.obs;

  RxString selectType = ''.obs;

  // MAX 110
  double max = 110;
  RxDouble canWidth = 0.0.obs;
  RxDouble plasticWidth = 0.0.obs;
  RxDouble petWidth = 0.0.obs;
  RxDouble get totalWidth => (max * 1.0).obs;

  RxInt can = 0.obs;
  RxInt plastic = 0.obs;
  RxInt pet = 0.obs;
  RxInt trash = 0.obs;
  RxInt total = 0.obs;

  RxString displayDate = '07-07-2561'.obs;
  RxString displayTime = '12 : 33'.obs;
  Timer? displayDateTimer;

  Timer? countdownTimer;
  DateTime cdown = DateTime(0, 0, 0, 0, 15);
  RxString displayCountdown = '15 : 00'.obs;

  @override
  void onInit() {
    super.onInit();

    lightManagement(status: true);
    Timer(const Duration(seconds: 2), () => Get.find<SmartBinApi>().playSound(command: 'all.ready'));

    try {
      display = arg['display'];
      accessModel = arg['token'];
    } catch (e) {}

    getDataType();

    initDisplayDateTime();
    displayDateTimer = Timer.periodic(const Duration(seconds: 60), (timer) {
      initDisplayDateTime();
    });

    countdownTimer = Timer.periodic(const Duration(seconds: 1), (_) {
      displayCountdown.value = DateFormat('mm : ss').format(cdown);
      cdown = cdown.subtract(const Duration(seconds: 1));

      if (displayCountdown.value == '00 : 00') {
        countdownTimer?.cancel();
      }
    });
  }

  Future<void> lightManagement({required bool status}) async {
    try {
      Response resp = await api.lightManagement(status ? 'on' : 'off');

      if (!resp.isOk) {
        SmartBinDialog.showWarning(desc: 'ไม่สามารถเปิดไฟถังขยะได้', onOk: () {});
      }
    } catch (e) {
      SmartBinDialog.showWarning(desc: 'ไม่สามารถเปิดไฟถังขยะได้', onOk: () {});
    }
  }

  Future<void> getDataType() async {
    try {
      Response resp = await api.getDataType();

      if (resp.isOk) {
        dataTypeModel = DataTypeModel.fromJson(resp.body);
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

  void initDisplayDateTime() {
    DateTime now = DateTime.now();

    displayTime.value = DateFormat('HH : mm').format(now);
    String date = DateFormat('dd-MM-yyyy').format(now);
    int yyyy = int.parse(date.substring(date.length - 4, date.length));
    date = date.replaceAll(yyyy.toString(), (yyyy + 543).toString());
    displayDate.value = date;
  }

  @override
  void onReady() {
    super.onReady();

    timer = Timer.periodic(const Duration(milliseconds: 400), (timer) {
      if (point.value == 3) {
        countdown = true;
      } else if (point.value == 0) {
        countdown = false;
      }

      if (countdown) {
        point--;
      } else {
        point++;

        // pet.value += 3;
        // plastic.value += 1;
        // can.value += 2;
      }
    });
  }

  void userSelectTypeProcess() {
    Timer(const Duration(seconds: 3), () {
      switch (selectType.value) {
        case 'พลาสติกขุ่น':
          userSelectType(type: 'pet');
          // pet.value += 1;
          break;
        case 'พลาสติกใส':
          userSelectType(type: 'plastic');
          // plastic.value += 1;
          break;
        case 'กระป๋อง':
          userSelectType(type: 'can');
          // can += 1;
          break;
        default:
          userSelectType(type: 'trash');
          // trash += 1;
          break;
      }

      // if (pet.value + plastic.value + can.value + trash.value > 0) {
      //   calPercen();
      // }

      // selectType = ''.obs;
      // isReady(true);
    });
  }

  void exchange() async {
    // processing
    isReady(false);

    userSelectTypeProcess();
    await prediction();
    Get.find<SmartBinApi>().playSound(command: 'all.ready');
  }

  Future<void> prediction() async {
    bool isDonate = false;

    if (accessModel?.accessToken == null) {
      isDonate = true;
    }

    try {
      Response resp = await api.prediction(
        <String, String>{
          "access_token": accessModel?.accessToken ?? "",
        },
        isDonate: isDonate,
      );

      if (resp.isOk) {
        PredictType model = PredictType.fromJson(resp.body);
        await countTypeById(model.data?.id as int);

        if ((model.binDetails?.can as int) > 95 ||
            (model.binDetails?.pet as int) > 95 ||
            (model.binDetails?.plastic as int) > 95 ||
            (model.binDetails?.unknown as int) > 95) {
          SmartBinDialog.showWarning(
            desc: 'ถังขยะเต็มแล้ว กรุณาใช้งานใหม่ภายหลัง',
            onOk: () => Get.offAllNamed(RoutePath.fullBin),
          );
        }
      } else {
        SmartBinDialog.showWarning(
          desc: 'ระบบมีปัญหา กรุณาลองใหม่ภายหลัง',
          onOk: () => Get.offAllNamed(RoutePath.fullBin),
        );
      }
    } catch (e) {
      SmartBinDialog.showError(
        desc: 'ระบบมีปัญหา กรุณาลองใหม่ภายหลัง',
        onOk: () => Get.offAllNamed(RoutePath.home),
      );
    }
  }

  Future<void> countTypeById(int id) async {
    String type = '';

    dataTypeModel.data?.forEach((elem) {
      if (id == elem.id) {
        type = elem.name ?? '';
      }
    });

    switch (type) {
      case 'pet':
        pet.value += 1;
        break;
      case 'plastic':
        plastic.value += 1;
        break;
      case 'can':
        can += 1;
        break;
      case 'trash':
        trash += 1;
        break;
    }

    if (pet.value + plastic.value + can.value + trash.value > 0) {
      calPercent();
    }

    selectType = ''.obs;
    isReady(true);
  }

  Future<void> userSelectType({required String type}) async {
    try {
      Response resp = await api.userSelectType(<String, String>{
        "user": display,
        "type": type,
        "datetime": DateTime.now().toString(),
      });

      print('userSelectType :: ${resp.statusCode}');
    } catch (e) {}
  }

  void calPercent() {
    total.value = pet.value + plastic.value + can.value + trash.value;
    canWidth.value = (can.value / total.value) * max;
    plasticWidth.value = (plastic.value / total.value) * max;
    petWidth.value = (pet.value / total.value) * max;
  }

  void gotoTotalScore() {
    int total = 0;

    dataTypeModel.data?.forEach((elem) {
      switch (elem.name ?? '') {
        case 'pet':
          total += pet.value * (elem.points as int);
          break;
        case 'plastic':
          total += plastic.value * (elem.points as int);
          break;
        case 'can':
          total += can.value * (elem.points as int);
          break;
        case 'trash':
          total += trash.value * (elem.points as int);
          break;
      }
    });

    Get.offAllNamed(RoutePath.totalPoint, arguments: <String, dynamic>{
      'display': display,
      'point': total,
    });
  }

  @override
  void onClose() {
    super.onClose();
    timer?.cancel();
    displayDateTimer?.cancel();
    countdownTimer?.cancel();
  }
}
