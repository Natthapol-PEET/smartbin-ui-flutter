import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartbin_ui_flutter/apis/smartbin_api.dart';
import 'package:smartbin_ui_flutter/controllers/enter_id_controller.dart';
import 'package:smartbin_ui_flutter/widgets/background.dart';

class EnterIDScreen extends GetView<EnterIDController> {
  const EnterIDScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<List<String>> listNumber = [
      ['1', '2', '3'],
      ['4', '5', '6'],
      ['7', '8', '9'],
      ['Clear', '0'],
    ];

    return Background(
        child: Column(
      children: [
        const SizedBox(height: 10),
        const Text(
          'ป้อนรหัสนิสิต/นักศึกษา',
          style: TextStyle(
            fontFamily: 'kanit',
            fontSize: 28,
            fontWeight: FontWeight.w500,
            color: Color(0xFF377422),
          ),
        ),
        const SizedBox(height: 20),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                Material(
                  elevation: 10,
                  child: SizedBox(
                    width: 200,
                    height: 48,
                    child: Center(
                      child: Obx(() => Text(
                            controller.studentId.value,
                            style: const TextStyle(fontFamily: 'kanit', fontSize: 24, fontWeight: FontWeight.w500),
                          )),
                    ),
                  ),
                ),
                const SizedBox(height: 35),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        Get.find<SmartBinApi>().playSound(command: 'all.back');
                        Get.back();
                      },
                      child: Image.asset('assets/images/buttons/back-short.png', height: 45),
                    ),
                    const SizedBox(width: 15),
                    InkWell(
                      onTap: () {
                        Get.find<SmartBinApi>().playSound(command: 'all.enter');
                        controller.gotoProcess();
                      },
                      child: Image.asset('assets/images/buttons/submit.png', height: 45),
                    ),
                  ],
                ),
              ],
            ),
            Column(
              children: [
                for (int i = 0; i < listNumber.length; i++) ...[
                  Row(
                    children: [
                      for (int j = 0; j < listNumber[i].length; j++) ...[
                        _digit(listNumber[i][j]),
                      ],
                    ],
                  ),
                ],
              ],
            ),
          ],
        ),
      ],
    ));
  }

  Widget _digit(String text) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: InkWell(
        onTap: text == 'Clear' ? controller.clear : () => controller.addDigit(text),
        child: Material(
          elevation: 4,
          borderRadius: BorderRadius.circular(10),
          color: text == 'Clear' ? Colors.amber.shade100 : Colors.blue.shade50,
          child: SizedBox(
            width: text == 'Clear' ? 120 : 55,
            height: 55,
            child: Center(
              child: Text(
                text,
                style: const TextStyle(
                  fontFamily: 'kanit',
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
