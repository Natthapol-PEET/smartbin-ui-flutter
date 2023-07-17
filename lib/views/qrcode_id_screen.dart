import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
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
        Text(
          'เข้าสู่ระบบโดย...',
          style: GoogleFonts.kanit(
            fontSize: 48,
            fontWeight: FontWeight.w500,
            color: const Color(0xFF377422),
          ),
        ),
        const SizedBox(height: 30),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            InkWell(
              onTap: () => Get.toNamed(RoutePath.scanQRCode),
              child: Column(
                children: [
                  Material(
                    shape: const StadiumBorder(),
                    elevation: 10,
                    child: Image.asset(
                      'assets/images/icons/qr-code.png',
                      width: 150,
                      height: 150,
                    ),
                  ),
                  Text(
                    'สแกนคิวอาร์โค้ด',
                    style: GoogleFonts.kanit(
                      fontSize: 28,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xFF377422),
                    ),
                  ),
                  Text(
                    '*ผู้ใช้งานจำเป็นต้องมีแอปพลิเคชัน KUSE Smart Bin\n(ถังขยะตาวิเศษ) ถึงจะสามารถเข้าใช้งานตัวเลือกนี้ได้',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.kanit(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            InkWell(
              onTap: () => Get.toNamed(RoutePath.enterId),
              child: Column(
                children: [
                  Material(
                    shape: const StadiumBorder(),
                    elevation: 10,
                    child: Image.asset(
                      'assets/images/icons/id.png',
                      width: 150,
                      height: 150,
                    ),
                  ),
                  Text(
                    'รหัสนิสิต/นักศึกษา',
                    style: GoogleFonts.kanit(
                      fontSize: 28,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xFF377422),
                    ),
                  ),
                  Text(
                    '*กรณีที่ไม่ใช่นิสิต/นักศึกษา\nสามารถเลือกสแกนคิวอาร์โค้ดหรือบริจาคได้',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.kanit(
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
