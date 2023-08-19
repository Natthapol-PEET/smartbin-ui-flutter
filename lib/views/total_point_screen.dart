import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartbin_ui_flutter/controllers/total_point_controller.dart';
import 'package:smartbin_ui_flutter/core/const.dart';
import 'package:smartbin_ui_flutter/core/router.dart';
import 'package:smartbin_ui_flutter/widgets/background.dart';

class TotalPointScreen extends GetView<TotalPointController> {
  const TotalPointScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Background(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: SCREEN_WIDTH * 0.8,
            height: SCREEN_HEIGHT * 0.7,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.6),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'คะแนนในการสะสมครั้งนี้',
                  style: TextStyle(
                    fontFamily: 'kanit',
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 6),
                Image.asset('assets/images/icons/user.png', width: 55),
                FittedBox(
                  child: Container(
                    // width: 140,
                    height: 30,
                    padding: const EdgeInsets.symmetric(horizontal: 18),
                    decoration: BoxDecoration(
                        color: Colors.amber.shade300,
                        borderRadius: BorderRadius.circular(10)),
                    child: Center(
                      child: Text(
                        controller.studentId,
                        style: const TextStyle(
                            fontFamily: 'kanit',
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Container(
                  width: 200,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.8),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Colors.amber,
                      width: 2,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      '${controller.point}  Point',
                      style: const TextStyle(
                          fontFamily: 'kanit',
                          fontSize: 22,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          InkWell(
            onTap: () => Get.offAllNamed(RoutePath.survey),
            child: Image.asset(
              'assets/images/buttons/submit.png',
              height: 45,
            ),
          ),
        ],
      ),
    );
  }
}
