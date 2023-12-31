import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartbin_ui_flutter/apis/smartbin_api.dart';
import 'package:smartbin_ui_flutter/core/router.dart';
import 'package:smartbin_ui_flutter/widgets/background.dart';

class SavingDonateScreen extends StatelessWidget {
  const SavingDonateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Background(
        child: Column(
      children: [
        const SizedBox(height: 10),
        const Text(
          'กรุณาเลือกรายการที่ต้องการ',
          style: TextStyle(
            fontFamily: 'kanit',
            fontSize: 28,
            fontWeight: FontWeight.w500,
            color: Color(0xFF377422),
          ),
        ),
        const SizedBox(height: 20),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            InkWell(
              onTap: () {
                Get.find<SmartBinApi>().playSound(command: 'list.collect');
                Get.toNamed(RoutePath.qrcodeId);
              },
              child: Column(
                children: [
                  Material(
                    shape: const StadiumBorder(),
                    elevation: 10,
                    child: Image.asset(
                      'assets/images/icons/saving.png',
                      width: 120,
                      height: 120,
                    ),
                  ),
                  const SizedBox(height: 5),
                  const Text(
                    'สะสมแต้ม',
                    style: TextStyle(
                      fontFamily: 'kanit',
                      fontSize: 22,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF377422),
                    ),
                  ),
                ],
              ),
            ),
            InkWell(
              onTap: () {
                Get.find<SmartBinApi>().playSound(command: 'list.donate');
                Get.offAllNamed(RoutePath.process, arguments: {
                  'display': 'ผู้พิทักษ์โลก',
                  'token': null,
                });
              },
              child: Column(
                children: [
                  Material(
                    shape: const StadiumBorder(),
                    elevation: 10,
                    child: Image.asset(
                      'assets/images/icons/donate.png',
                      width: 120,
                      height: 120,
                    ),
                  ),
                  const SizedBox(height: 5),
                  const Text(
                    'บริจาค',
                    style: TextStyle(
                      fontFamily: 'kanit',
                      fontSize: 22,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF377422),
                    ),
                  ),
                  const Text(
                    '*กรณีที่เลือกบริจาค\nจะไม่ได้รับคะแนนจากการทิ้งขยะครั้งนี้',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'kanit',
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: Colors.redAccent,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 25),
        InkWell(
          onTap: () {
            Get.find<SmartBinApi>().playSound(command: 'all.back');
            Get.back();
          },
          child: Image.asset('assets/images/buttons/howto-back.png', height: 45),
        ),
      ],
    ));
  }
}
