import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smartbin_ui_flutter/widgets/background.dart';

class ProcessController extends GetxController {
  RxInt point = 0.obs;
  Timer? timer;
  bool countdown = false;
  RxBool isReady = true.obs;

  // MAX 160
  int max = 160;
  RxDouble canWidth = 0.0.obs;
  RxDouble plasticWidth = 0.0.obs;
  RxDouble wineWidth = 0.0.obs;
  RxDouble get totalWidth => (max * 1.0).obs;

  RxInt can = 0.obs;
  RxInt plastic = 0.obs;
  RxInt wine = 0.obs;
  RxInt total = 0.obs;

  // @override
  // void onInit() {
  //   super.onInit();
  // }

  @override
  void onReady() {
    super.onReady();

    timer = Timer.periodic(const Duration(milliseconds: 400), (timer) {
      if (point.value == 3) {
        countdown = true;
      } else if (point.value == 0) {
        countdown = false;
        isReady.toggle();
      }

      if (countdown) {
        point--;
      } else {
        point++;

        wine.value += 3;
        plastic.value += 1;
        // can.value += 2;
      }

      calPercen();
    });
  }

  void calPercen() {
    total.value = wine.value + plastic.value + can.value;
    canWidth.value = (can.value / total.value) * max;
    plasticWidth.value = (plastic.value / total.value) * max;
    wineWidth.value = (wine.value / total.value) * max;
  }

  @override
  void onClose() {
    super.onClose();
    timer?.cancel();
  }
}

class ProcessScreen extends StatelessWidget {
  ProcessScreen({super.key});

  final controlle = Get.put(ProcessController());

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
                    Image.asset('assets/images/icons/calendar.png',
                        width: 50, height: 50),
                    const SizedBox(width: 10),
                    Text(
                      '07-07-2566',
                      style: GoogleFonts.kanit(
                          fontSize: 32, fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(width: 20),
                    Image.asset('assets/images/icons/clock.png',
                        width: 50, height: 50),
                    const SizedBox(width: 10),
                    Text(
                      '12 : 30',
                      style: GoogleFonts.kanit(
                          fontSize: 32, fontWeight: FontWeight.w500),
                    ),
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
                    width: Get.width / 2.2,
                    height: 300,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(8)),
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
                                Text('สวัสดี คุณ',
                                    style: GoogleFonts.kanit(
                                        fontSize: 22,
                                        fontWeight: FontWeight.w500)),
                                const SizedBox(height: 5),
                                Container(
                                  width: 180,
                                  height: 40,
                                  decoration: BoxDecoration(
                                      color: Colors.amber.shade300,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Center(
                                    child: Text(
                                      '6040202424',
                                      style: GoogleFonts.kanit(
                                          fontSize: 22,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 35),
                        Obx(() => IndexedStack(
                              index: controlle.isReady.isTrue ? 0 : 1,
                              children: [
                                SizedBox(
                                  width: Get.width / 2.2,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Image.asset('assets/images/icons/relax.png',
                                          width: 100),
                                      const SizedBox(height: 10),
                                      Text(
                                        'ถังขยะพร้อมทำงาน',
                                        style: GoogleFonts.kanit(
                                          fontSize: 28,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: Get.width / 2.2,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      const SpinKitPouringHourGlassRefined(
                                          color: Colors.orange, size: 80),
                                      const SizedBox(height: 10),
                                      Obx(() => Text(
                                            'กำลังประมวลผล ${'. ' * controlle.point.value}',
                                            style: GoogleFonts.kanit(
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
                        onTap: () => Get.back(),
                        child: Image.asset('assets/images/buttons/exchange.png',
                            width: 120),
                      ),
                      const SizedBox(width: 20),
                      InkWell(
                        onTap: () {},
                        child: Image.asset('assets/images/buttons/look-score.png',
                            width: 130),
                      ),
                    ],
                  ),
                ],
              ),
              Container(
                width: Get.width / 2.5,
                height: 360,
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 14),
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
                      score: controlle.wine,
                      percen: controlle.wineWidth,
                    ),
                    slotType(
                      type: 'พลาสติก',
                      color: const Color.fromARGB(255, 64, 186, 243),
                      image: 'assets/images/icons/plastic.png',
                      score: controlle.plastic,
                      percen: controlle.plasticWidth,
                    ),
                    slotType(
                      type: 'กระป๋อง',
                      color: const Color(0xFFFDDE72),
                      image: 'assets/images/icons/beer-can.png',
                      score: controlle.can,
                      percen: controlle.canWidth,
                    ),
                    slotType(
                      type: 'รวมทั้งหมด',
                      color: Colors.white,
                      image: 'assets/images/icons/waste.png',
                      score: controlle.total,
                      percen: controlle.totalWidth,
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
                      style: GoogleFonts.kanit(
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
                        duration: const Duration(seconds: 1),
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
                            style: GoogleFonts.kanit(
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
          Text(
            'ชิ้น',
            style: GoogleFonts.kanit(
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
