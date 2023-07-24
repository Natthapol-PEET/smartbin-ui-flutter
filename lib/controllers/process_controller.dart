import 'dart:async';
import 'dart:math';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:smartbin_ui_flutter/core/controller_base.dart';

class ProcessController extends BaseController {
  String get studentId => Get.arguments ?? 'คนรักษ์โลก';
  RxInt point = 0.obs;
  Timer? timer;
  bool countdown = false;
  RxBool isReady = true.obs;

  RxString selectType = ''.obs;

  // MAX 160
  int max = 160;
  RxDouble canWidth = 0.0.obs;
  RxDouble plasticWidth = 0.0.obs;
  RxDouble wineWidth = 0.0.obs;
  RxDouble get totalWidth => (max * 1.0).obs;

  RxInt can = 0.obs;
  RxInt plastic = 0.obs;
  RxInt wine = 0.obs;
  RxInt total = 0.obs;

  RxString displayDate = '07-07-2561'.obs;
  RxString displayTime = '12 : 33'.obs;
  Timer? displayDateTimer;

  @override
  void onInit() {
    super.onInit();

    initDisplayDateTime();
    displayDateTimer = Timer.periodic(const Duration(seconds: 60), (timer) {
      initDisplayDateTime();
    });
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

        // wine.value += 3;
        // plastic.value += 1;
        // can.value += 2;
      }
    });
  }

  void exchange() {
    // processing
    isReady(false);

    var rng = Random();
    int number = rng.nextInt(3);

    Timer(const Duration(seconds: 3), () {
      switch (number) {
        case 0:
          wine.value += 1;
          break;
        case 1:
          plastic.value += 1;
          break;
        case 2:
          can += 1;
          break;
        default:
          break;
      }

      calPercen();
      isReady(true);
    });
  }

  void calPercen() {
    total.value = wine.value + plastic.value + can.value;
    canWidth.value = (can.value / total.value) * max;
    plasticWidth.value = (plastic.value / total.value) * max;
    wineWidth.value = (wine.value / total.value) * max;
  }

  @override
  void onClose() {
    super.onClose();
    timer?.cancel();
    displayDateTimer?.cancel();
  }
}
