import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:smartbin_ui_flutter/controllers/process_controller.dart';
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
                Image.asset('assets/images/icons/KUSE-logo.png', height: 60),
                Row(
                  children: [
                    Image.asset('assets/images/icons/calendar.png', width: 50, height: 50),
                    const SizedBox(width: 10),
                    Obx(() => Text(
                          controller.displayDate.value,
                          style: const TextStyle(fontFamily: 'kanit', fontSize: 32, fontWeight: FontWeight.w500),
                        )),
                    const SizedBox(width: 20),
                    Image.asset('assets/images/icons/clock.png', width: 50, height: 50),
                    const SizedBox(width: 10),
                    Obx(() => Text(
                          controller.displayTime.value,
                          style: const TextStyle(fontFamily: 'kanit', fontSize: 32, fontWeight: FontWeight.w500),
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
                    width: 800 / 2.2,
                    height: 300,
                    padding: const EdgeInsets.all(10),
                    decoration:
                        BoxDecoration(color: Colors.white.withOpacity(0.5), borderRadius: BorderRadius.circular(8)),
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset('assets/images/icons/user.png', width: 80),
                            const SizedBox(width: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text('สวัสดี คุณ',
                                    style: TextStyle(fontFamily: 'kanit', fontSize: 22, fontWeight: FontWeight.w500)),
                                const SizedBox(height: 5),
                                Container(
                                  width: 180,
                                  height: 40,
                                  decoration: BoxDecoration(
                                      color: Colors.amber.shade300, borderRadius: BorderRadius.circular(10)),
                                  child: Center(
                                    child: Text(
                                      controller.studentId,
                                      style: const TextStyle(
                                          fontFamily: 'kanit', fontSize: 22, fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 35),
                        Obx(() => IndexedStack(
                              index: controller.isReady.isTrue ? 0 : 1,
                              children: [
                                SizedBox(
                                  width: 800 / 2.2,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Image.asset('assets/images/icons/relax.png', width: 100),
                                      const SizedBox(height: 10),
                                      const Text(
                                        'ถังขยะพร้อมทำงาน',
                                        style: TextStyle(
                                          fontFamily: 'kanit',
                                          fontSize: 28,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 800 / 2.2,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      const SpinKitPouringHourGlassRefined(color: Colors.orange, size: 80),
                                      const SizedBox(height: 10),
                                      Obx(() => Text(
                                            'กำลังประมวลผล ${'. ' * controller.point.value}',
                                            style: const TextStyle(
                                              fontFamily: 'kanit',
                                              fontSize: 28,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          )),
                                    ],
                                  ),
                                ),
                              ],
                            )),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      InkWell(
                        // onTap: controller.exchange,
                        // onTap: () => Get.toNamed(RoutePath.userSelectType),
                        onTap: () {
                          Get.defaultDialog(
                            title: 'ช่วยบอกประเภทขยะที่ทิ้งหน่อยค้าบ',
                            titlePadding: const EdgeInsets.symmetric(vertical: 20),
                            titleStyle: const TextStyle(
                              fontFamily: 'Kanit',
                              fontSize: 28,
                              fontWeight: FontWeight.w600,
                            ),
                            barrierDismissible: false,
                            content: SizedBox(
                              width: 600,
                              height: 300,
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: 370,
                                        height: 240,
                                        decoration: BoxDecoration(
                                            color: Colors.white.withOpacity(0.5),
                                            borderRadius: BorderRadius.circular(10),
                                            border: Border.all()),
                                        child: Column(
                                          children: [
                                            const SizedBox(height: 6),
                                            Image.asset(
                                              'assets/images/icons/recycle.png',
                                              width: 50,
                                              fit: BoxFit.cover,
                                            ),
                                            const SizedBox(height: 10),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                              children: [
                                                itemSelectType(
                                                  type: 'ขวดแก้ว',
                                                  image: 'assets/images/icons/wine.png',
                                                  iconColor: const Color(0xFF77AE54).withOpacity(0.8),
                                                  bgColor: const Color(0xFF77AE54).withOpacity(0.1),
                                                  selectColor: Colors.green,
                                                ),
                                                itemSelectType(
                                                  type: 'พลาสติก',
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
                                        width: 130,
                                        height: 240,
                                        decoration: BoxDecoration(
                                            color: Colors.white.withOpacity(0.5),
                                            borderRadius: BorderRadius.circular(10),
                                            border: Border.all()),
                                        child: Column(
                                          children: [
                                            const SizedBox(height: 10),
                                            Image.asset(
                                              'assets/images/icons/non-recycle.png',
                                              width: 50,
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
                                  const SizedBox(height: 10),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      InkWell(
                                        onTap: () => Get.back(),
                                        child: Image.asset(
                                          'assets/images/buttons/back-short.png',
                                          height: 50,
                                          fit: BoxFit.fitHeight,
                                        ),
                                      ),
                                      const SizedBox(width: 14),
                                      InkWell(
                                        onTap: () {
                                          Get.back();
                                          controller.exchange();
                                          controller.selectType('');
                                        },
                                        child: Image.asset(
                                          'assets/images/buttons/submit.png',
                                          height: 50,
                                          fit: BoxFit.fitHeight,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                        child: Image.asset('assets/images/buttons/exchange.png', width: 120),
                      ),
                      const SizedBox(width: 20),
                      InkWell(
                        onTap: () {},
                        child: Image.asset('assets/images/buttons/look-score.png', width: 130),
                      ),
                    ],
                  ),
                ],
              ),
              Container(
                width: 800 / 2.5 + 1,
                height: 360,
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 14),
                decoration: BoxDecoration(
                  color: Colors.green.shade300.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    slotType(
                      type: 'ขวดแก้ว',
                      color: const Color(0xFF77AE54),
                      image: 'assets/images/icons/wine.png',
                      score: controller.wine,
                      percen: controller.wineWidth,
                    ),
                    slotType(
                      type: 'พลาสติก',
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
            width: 100,
            height: 150,
            decoration: BoxDecoration(
              color: bgColor,
              borderRadius: BorderRadius.circular(8),
              border: controller.selectType.value == type ? Border.all(color: selectColor, width: 2) : null,
            ),
            child: Column(
              children: [
                const SizedBox(height: 10),
                SizedBox(
                  width: 80,
                  child: Column(
                    children: [
                      Container(
                        width: 45,
                        height: 45,
                        padding: const EdgeInsets.all(10),
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
                          fontSize: 16,
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
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              SizedBox(
                width: 80,
                child: Column(
                  children: [
                    Container(
                      width: 45,
                      height: 45,
                      padding: const EdgeInsets.all(10),
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
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 10),
              Stack(
                children: [
                  Obx(() => AnimatedContainer(
                        width: percen.value,
                        height: 40,
                        duration: const Duration(milliseconds: 600),
                        decoration: BoxDecoration(
                          color: color,
                          borderRadius: BorderRadius.circular(8),
                        ),
                      )),
                  SizedBox(
                    width: 160,
                    height: 40,
                    child: Center(
                      child: Obx(() => Text(
                            score.toString(),
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontFamily: 'kanit',
                              fontSize: 22,
                              fontWeight: FontWeight.w500,
                            ),
                          )),
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(width: 10),
          const Text(
            'ชิ้น',
            style: TextStyle(
              fontFamily: 'kanit',
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
