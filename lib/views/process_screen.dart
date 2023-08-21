import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:smartbin_ui_flutter/apis/smartbin_api.dart';
import 'package:smartbin_ui_flutter/controllers/process_controller.dart';
import 'package:smartbin_ui_flutter/core/const.dart';
import 'package:smartbin_ui_flutter/widgets/background.dart';

class ProcessScreen extends GetView<ProcessController> {
  const ProcessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Background(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset('assets/images/icons/KUSE-logo.png', height: 45),
                Row(
                  children: [
                    Image.asset('assets/images/icons/calendar.png', width: 32, height: 32),
                    const SizedBox(width: 5),
                    Obx(() => Text(
                          controller.displayDate.value,
                          style: const TextStyle(fontFamily: 'kanit', fontSize: 20, fontWeight: FontWeight.w500),
                        )),
                    const SizedBox(width: 10),
                    Image.asset('assets/images/icons/clock.png', width: 32, height: 32),
                    const SizedBox(width: 5),
                    Obx(() => Text(
                          controller.displayTime.value,
                          style: const TextStyle(fontFamily: 'kanit', fontSize: 20, fontWeight: FontWeight.w500),
                        )),
                  ],
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  Container(
                    width: SCREEN_WIDTH / 2.2,
                    height: 220,
                    padding: const EdgeInsets.all(10),
                    decoration:
                        BoxDecoration(color: Colors.white.withOpacity(0.5), borderRadius: BorderRadius.circular(8)),
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset('assets/images/icons/user.png', width: 55),
                            const SizedBox(width: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text('สวัสดี คุณ',
                                    style: TextStyle(fontFamily: 'kanit', fontSize: 18, fontWeight: FontWeight.w500)),
                                const SizedBox(height: 3),
                                Container(
                                  // width: 140,
                                  height: 30,
                                  padding: const EdgeInsets.symmetric(horizontal: 18),
                                  decoration: BoxDecoration(
                                      color: Colors.amber.shade300, borderRadius: BorderRadius.circular(10)),
                                  child: Center(
                                    child: Text(
                                      controller.display,
                                      style: const TextStyle(
                                          fontFamily: 'kanit', fontSize: 16, fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Obx(
                          () => IndexedStack(
                            index: controller.isReady.isTrue ? 0 : 1,
                            children: [
                              SizedBox(
                                width: SCREEN_WIDTH / 2.2,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Image.asset('assets/images/icons/relax.png', width: 55),
                                    const SizedBox(height: 10),
                                    const Text(
                                      'ถังขยะพร้อมทำงาน',
                                      style: TextStyle(
                                        fontFamily: 'kanit',
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: SCREEN_WIDTH / 2.2,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const SpinKitPouringHourGlassRefined(color: Colors.orange, size: 55),
                                    const SizedBox(height: 10),
                                    Obx(() => Text(
                                          'กำลังประมวลผล ${'. ' * controller.point.value}',
                                          style: const TextStyle(
                                            fontFamily: 'kanit',
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        )),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 2),
                        Material(
                          color: Colors.white.withOpacity(0.5),
                          shape: const StadiumBorder(),
                          child: Padding(
                            padding: const EdgeInsets.all(5),
                            child: Obx(() => Text(
                                  'เวลาที่เหลือในการทำรายการ ${controller.displayCountdown.value} นาที',
                                  style: TextStyle(
                                    fontFamily: 'kanit',
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.amber.shade900,
                                  ),
                                )),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Obx(() => InkWell(
                            onTap: controller.isReady.isTrue
                                ? () {
                                    Get.find<SmartBinApi>().playSound(command: 'main.exchange');
                                    _showDialog();
                                  }
                                : null,
                            child: Image.asset('assets/images/buttons/exchange.png', width: 90),
                          )),
                      const SizedBox(width: 12),
                      Obx(() => InkWell(
                            onTap: controller.isReady.isTrue
                                ? () {
                                    Get.find<SmartBinApi>().playSound(command: 'all.lookscore');
                                    controller.gotoTotalScore();
                                  }
                                : null,
                            child: Image.asset('assets/images/buttons/look-score.png', width: 95),
                          )),
                    ],
                  ),
                ],
              ),
              Container(
                width: SCREEN_WIDTH / 2.5 + 1,
                height: 260,
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 14),
                decoration: BoxDecoration(
                  color: Colors.green.shade300.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    slotType(
                      type: 'พลาสติกขุ่น',
                      color: const Color(0xFF77AE54),
                      image: 'assets/images/icons/wine.png',
                      score: controller.pet,
                      percen: controller.petWidth,
                    ),
                    slotType(
                      type: 'พลาสติกใส',
                      color: const Color.fromARGB(255, 64, 186, 243),
                      image: 'assets/images/icons/plastic.png',
                      score: controller.plastic,
                      percen: controller.plasticWidth,
                    ),
                    slotType(
                      type: 'กระป๋อง',
                      color: const Color(0xFFFDDE72),
                      image: 'assets/images/icons/beer-can.png',
                      score: controller.can,
                      percen: controller.canWidth,
                    ),
                    slotType(
                      type: 'รวมทั้งหมด',
                      color: Colors.white,
                      image: 'assets/images/icons/waste.png',
                      score: controller.total,
                      percen: controller.totalWidth,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _showDialog() {
    Get.defaultDialog(
      title: 'ช่วยบอกประเภทขยะที่ทิ้งหน่อยค้าบ',
      titlePadding: const EdgeInsets.symmetric(vertical: 12),
      titleStyle: const TextStyle(
        fontFamily: 'Kanit',
        fontSize: 18,
        fontWeight: FontWeight.w600,
      ),
      barrierDismissible: false,
      content: SizedBox(
        width: SCREEN_WIDTH * 0.8,
        height: SCREEN_HEIGHT * 0.6,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 300,
                  height: 165,
                  decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all()),
                  child: Column(
                    children: [
                      const SizedBox(height: 6),
                      Image.asset(
                        'assets/images/icons/recycle.png',
                        width: 35,
                        fit: BoxFit.cover,
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          itemSelectType(
                            type: 'พลาสติกขุ่น',
                            image: 'assets/images/icons/wine.png',
                            iconColor: const Color(0xFF77AE54).withOpacity(0.8),
                            bgColor: const Color(0xFF77AE54).withOpacity(0.1),
                            selectColor: Colors.green,
                          ),
                          itemSelectType(
                            type: 'พลาสติกใส',
                            image: 'assets/images/icons/coffee.png',
                            iconColor: const Color.fromARGB(255, 64, 186, 243).withOpacity(0.8),
                            bgColor: const Color.fromARGB(255, 64, 186, 243).withOpacity(0.1),
                            selectColor: Colors.blue,
                          ),
                          itemSelectType(
                            type: 'กระป๋อง',
                            image: 'assets/images/icons/coffee.png',
                            iconColor: const Color(0xFFFDDE72),
                            bgColor: const Color(0xFFFDDE72).withOpacity(0.2),
                            selectColor: Colors.yellow.shade700,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 100,
                  height: 165,
                  decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all()),
                  child: Column(
                    children: [
                      const SizedBox(height: 10),
                      Image.asset(
                        'assets/images/icons/non-recycle.png',
                        width: 35,
                        fit: BoxFit.cover,
                      ),
                      const SizedBox(height: 6),
                      itemSelectType(
                        type: 'ขยะ\nประเภทอื่น',
                        image: 'assets/images/icons/coffee.png',
                        iconColor: Colors.redAccent.withOpacity(0.8),
                        bgColor: Colors.redAccent.withOpacity(0.1),
                        selectColor: Colors.red,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    Get.find<SmartBinApi>().playSound(command: 'all.back');
                    controller.selectType = ''.obs;
                    Get.back();
                  },
                  child: Image.asset(
                    'assets/images/buttons/back-short.png',
                    height: 35,
                    fit: BoxFit.fitHeight,
                  ),
                ),
                const SizedBox(width: 14),
                Obx(() => InkWell(
                      onTap: controller.selectType.value == ''
                          ? null
                          : () {
                              Get.find<SmartBinApi>().playSound(command: 'all.process');
                              Get.back();
                              controller.exchange();
                            },
                      child: Image.asset(
                        'assets/images/buttons/submit.png',
                        height: 35,
                        fit: BoxFit.fitHeight,
                      ),
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget itemSelectType({
    required String type,
    required Color iconColor,
    required Color bgColor,
    required Color selectColor,
    required String image,
  }) {
    return InkWell(
      onTap: () => controller.selectType(type),
      child: Obx(() => Container(
            width: 80,
            height: 100,
            decoration: BoxDecoration(
              color: bgColor,
              borderRadius: BorderRadius.circular(8),
              border: controller.selectType.value == type ? Border.all(color: selectColor, width: 2) : null,
            ),
            child: Column(
              children: [
                const SizedBox(height: 8),
                SizedBox(
                  width: 80,
                  child: Column(
                    children: [
                      Container(
                        width: 35,
                        height: 35,
                        padding: const EdgeInsets.all(6),
                        margin: const EdgeInsets.only(bottom: 2),
                        decoration: BoxDecoration(
                          color: iconColor,
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: Image.asset(image),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        type,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontFamily: 'kanit',
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )),
    );
  }

  Widget slotType({
    required String type,
    required Color color,
    required String image,
    required RxInt score,
    required RxDouble percen,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 7),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              SizedBox(
                width: 65,
                child: Column(
                  children: [
                    Container(
                      width: 32,
                      height: 32,
                      padding: const EdgeInsets.all(8),
                      margin: const EdgeInsets.only(bottom: 2),
                      decoration: BoxDecoration(
                        color: color,
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Image.asset(image),
                    ),
                    Text(
                      type,
                      style: const TextStyle(
                        fontFamily: 'kanit',
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 5),
              Stack(
                children: [
                  Obx(() => AnimatedContainer(
                        width: percen.value,
                        height: 35,
                        duration: const Duration(milliseconds: 600),
                        decoration: BoxDecoration(
                          color: color,
                          borderRadius: BorderRadius.circular(8),
                        ),
                      )),
                  SizedBox(
                    width: controller.max,
                    height: 35,
                    child: Center(
                      child: Obx(() => Text(
                            score.toString(),
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontFamily: 'kanit',
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          )),
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(width: 4),
          const Text(
            'ชิ้น',
            style: TextStyle(
              fontFamily: 'kanit',
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
