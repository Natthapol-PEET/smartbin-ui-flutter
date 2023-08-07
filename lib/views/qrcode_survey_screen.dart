import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartbin_ui_flutter/controllers/qrcode_survey_controller.dart';
import 'package:smartbin_ui_flutter/core/const.dart';
import 'package:smartbin_ui_flutter/widgets/background.dart';

class QrCodeSurveyScreen extends GetView<QrCodeSurveyController> {
  const QrCodeSurveyScreen({super.key});

  @override
  @override
  Widget build(BuildContext context) {
    return Background(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: SCREEN_WIDTH * 0.8,
            height: SCREEN_HEIGHT * 0.9,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.6),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'คุณเองก็สามารถแสดงความคิดเห็นได้นะ\nสแกนเลย !!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'kanit',
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 14),
                Image.asset(
                  'assets/images/KUSE-SmartBin-Survey.jpg',
                  width: 200,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
