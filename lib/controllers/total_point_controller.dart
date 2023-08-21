import 'dart:async';

import 'package:get/get.dart';
import 'package:smartbin_ui_flutter/apis/smartbin_api.dart';

class TotalPointController extends GetxController {
  String studentId = '';
  int point = 0;

  Map<String, dynamic> get args => Get.arguments;
  // Map<String, dynamic> get args => <String, dynamic>{
  //       'display': 'ผู้พิทักษ์โลก',
  //       'point': 200,
  //     };

  @override
  void onInit() {
    super.onInit();

    Timer(const Duration(seconds: 2), () => Get.find<SmartBinApi>().playSound(command: 'all.total'));

    try {
      studentId = args['display'];
      point = args['point'];
    } catch (e) {}
  }
}
