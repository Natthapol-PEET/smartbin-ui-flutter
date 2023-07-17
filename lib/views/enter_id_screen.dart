import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smartbin_ui_flutter/core/router.dart';
import 'package:smartbin_ui_flutter/widgets/background.dart';

class EnterIDScreen extends StatelessWidget {
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
        Text(
          'ป้อนรหัสนิสิต/นักศึกษา',
          style: GoogleFonts.kanit(
            fontSize: 48,
            fontWeight: FontWeight.w500,
            color: const Color(0xFF377422),
          ),
        ),
        const SizedBox(height: 30),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                Material(
                  elevation: 10,
                  child: SizedBox(
                    width: 300,
                    height: 65,
                    child: Center(
                      child: Text(
                        '6040202424',
                        style: GoogleFonts.kanit(
                          fontSize: 36,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 35),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () => Get.back(),
                      child: Image.asset('assets/images/buttons/back-short.png'),
                    ),
                    const SizedBox(width: 20),
                    InkWell(
                      onTap: () => Get.toNamed(RoutePath.process),
                      child: Image.asset('assets/images/buttons/submit.png'),
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
        onTap: () {},
        child: Material(
          elevation: 4,
          borderRadius: BorderRadius.circular(10),
          color: text == 'Clear' ? Colors.amber.shade100 : Colors.blue.shade50,
          child: SizedBox(
            width: text == 'Clear' ? 170 : 80,
            height: 70,
            child: Center(
              child: Text(
                text,
                style: GoogleFonts.kanit(
                  fontSize: 36,
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