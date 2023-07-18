import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartbin_ui_flutter/controllers/scan_qrcode_controller.dart';
import 'package:smartbin_ui_flutter/widgets/background.dart';

class ScanQRCodeScreen extends GetView<ScanQRCodeController> {
  const ScanQRCodeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Background(
        child: Column(
      children: [
        const SizedBox(height: 10),
        const Text(
          'แสกน QR Code',
          style: TextStyle(
            fontFamily: 'kanit',
            fontSize: 48,
            fontWeight: FontWeight.w500,
            color: Color(0xFF377422),
          ),
        ),
        const SizedBox(height: 30),
        Material(
          elevation: 10,
          child: Image.asset(
            'assets/images/qr-code.png',
            width: 150,
            height: 150,
          ),
        ),
        const SizedBox(height: 10),
        Obx(() => Text(
              'โปรดสแกนภายในเวลา ${controller.count.value} วินาที',
              style: const TextStyle(
                fontFamily: 'kanit',
                fontSize: 22,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            )),
        const SizedBox(height: 35),
        InkWell(
          onTap: () => Get.back(),
          child: Image.asset('assets/images/buttons/howto-back.png'),
        ),
      ],
    ));
  }
}
