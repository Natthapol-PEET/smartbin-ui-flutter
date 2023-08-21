import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartbin_ui_flutter/apis/smartbin_api.dart';
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
            fontSize: 28,
            fontWeight: FontWeight.w500,
            color: Color(0xFF377422),
          ),
        ),
        const SizedBox(height: 20),
        Material(
          elevation: 10,
          child: SizedBox(
              width: 120,
              height: 120,
              child: Obx(
                () => controller.showQrCode.isTrue ? LoadQrCode() : SizedBox(),
              )),
        ),
        const SizedBox(height: 10),
        Obx(() => Text(
              'โปรดสแกนภายในเวลา ${controller.count.value} วินาที',
              style: const TextStyle(
                fontFamily: 'kanit',
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            )),
        const SizedBox(height: 35),
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

class LoadQrCode extends StatefulWidget {
  const LoadQrCode({super.key});

  @override
  State<LoadQrCode> createState() => _LoadQrCodeState();
}

class _LoadQrCodeState extends State<LoadQrCode> {
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: 'http://localhost:8080/api/v1/smartbin/login_qrcode',
      httpHeaders: const <String, String>{'authorization': 'Bearer 1234'},
      placeholder: (context, url) => const Padding(
        padding: EdgeInsets.all(45),
        child: CircularProgressIndicator(strokeWidth: 3),
      ),
      errorWidget: (context, url, error) => const Icon(Icons.error),
    );
  }
}
