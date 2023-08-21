import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartbin_ui_flutter/apis/smartbin_api.dart';
import 'package:smartbin_ui_flutter/core/router.dart';
import 'package:smartbin_ui_flutter/widgets/background.dart';

class QRCodeIDScreen extends StatelessWidget {
  const QRCodeIDScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Background(
        child: Column(
      children: [
        const SizedBox(height: 10),
        const Text(
          'เข้าสู่ระบบโดย...',
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
                Get.find<SmartBinApi>().playSound(command: 'login.qrcode');
                Get.toNamed(RoutePath.scanQRCode);
              },
              child: Column(
                children: [
                  Material(
                    shape: const StadiumBorder(),
                    elevation: 10,
                    child: Image.asset(
                      'assets/images/icons/qr-code.png',
                      width: 120,
                      height: 120,
                    ),
                  ),
                  const SizedBox(height: 5),
                  const Text(
                    'สแกนคิวอาร์โค้ด',
                    style: TextStyle(
                      fontFamily: 'kanit',
                      fontSize: 22,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF377422),
                    ),
                  ),
                  const Text(
                    '*ผู้ใช้งานจำเป็นต้องมีแอปพลิเคชัน KUSE Smart Bin\n(ถังขยะตาวิเศษ) ถึงจะสามารถเข้าใช้งานตัวเลือกนี้ได้',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'kanit',
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            InkWell(
              onTap: () {
                Get.find<SmartBinApi>().playSound(command: 'login.sid');
                Get.toNamed(RoutePath.enterId);
              },
              child: Column(
                children: [
                  Material(
                    shape: const StadiumBorder(),
                    elevation: 10,
                    child: Image.asset(
                      'assets/images/icons/id.png',
                      width: 120,
                      height: 120,
                    ),
                  ),
                  const SizedBox(height: 5),
                  const Text(
                    'รหัสนิสิต/นักศึกษา',
                    style: TextStyle(
                      fontFamily: 'kanit',
                      fontSize: 22,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF377422),
                    ),
                  ),
                  const Text(
                    '*กรณีที่ไม่ใช่นิสิต/นักศึกษา\nสามารถเลือกสแกนคิวอาร์โค้ดหรือบริจาคได้',
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
