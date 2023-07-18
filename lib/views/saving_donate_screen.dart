import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
            fontSize: 48,
            fontWeight: FontWeight.w500,
            color: Color(0xFF377422),
          ),
        ),
        const SizedBox(height: 30),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            InkWell(
              onTap: () => Get.toNamed(RoutePath.qrcodeId),
              child: Column(
                children: [
                  Material(
                    shape: const StadiumBorder(),
                    elevation: 10,
                    child: Image.asset(
                      'assets/images/icons/saving.png',
                      width: 150,
                      height: 150,
                    ),
                  ),
                  const Text(
                    'สะสมแต้ม',
                    style: TextStyle(
                      fontFamily: 'kanit',
                      fontSize: 28,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF377422),
                    ),
                  ),
                ],
              ),
            ),
            InkWell(
              onTap: () => Get.offAllNamed(RoutePath.process),
              child: Column(
                children: [
                  Material(
                    shape: const StadiumBorder(),
                    elevation: 10,
                    child: Image.asset(
                      'assets/images/icons/donate.png',
                      width: 150,
                      height: 150,
                    ),
                  ),
                  const Text(
                    'บริจาค',
                    style: TextStyle(
                      fontFamily: 'kanit',
                      fontSize: 28,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF377422),
                    ),
                  ),
                  const Text(
                    '*กรณีที่เลือกบริจาค\nจะไม่ได้รับคะแนนจากการทิ้งขยะครั้งนี้',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'kanit',
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.redAccent,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 35),
        InkWell(
          onTap: () => Get.back(),
          child: Image.asset('assets/images/buttons/howto-back.png'),
        ),
      ],
    ));
  }
}
