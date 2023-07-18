import 'dart:math';

import 'package:flutter/material.dart';

// ignore: must_be_immutable
class WaveProgress extends StatefulWidget {
  WaveProgress({
    super.key,
    required this.size,
    required this.borderColor,
    required this.fillColor,
    required this.progress,
    required this.child,
  });

  final double size;
  final Color borderColor, fillColor;
  final double progress;
  Widget child;

  @override
  State<WaveProgress> createState() => _WaveProgressState();
}

class _WaveProgressState extends State<WaveProgress> with TickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2500),
    );

    controller.repeat();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.size,
      height: widget.size,
      child: ClipPath(
        clipper: CircleClipper(),
        child: AnimatedBuilder(
          animation: controller,
          builder: (context, child) {
            return CustomPaint(
              painter: WaveProgressPainter(
                controller,
                widget.borderColor,
                widget.fillColor,
                widget.progress,
              ),
              child: widget.child,
            );
          },
        ),
      ),
    );
  }
}

class WaveProgressPainter extends CustomPainter {
  Animation<double> animation;
  Color borderColor, fillColor;
  double progress;

  WaveProgressPainter(this.animation, this.borderColor, this.fillColor, this.progress) : super(repaint: animation);

  @override
  void paint(Canvas canvas, Size size) {
    // draw small wave
    Paint wave2Paint = Paint()..color = fillColor.withOpacity(0.5);
    double p = progress / 100.0;
    double n = 4.2;
    double amp = 4.0;
    double baseHeight = (1 - p) * size.height;

    Path path = Path();
    path.moveTo(0.0, baseHeight);
    for (double i = 0.0; i < size.width; i++) {
      path.lineTo(i, baseHeight + sin((i / size.width * 2 * pi * n) + (animation.value * 2 * pi) + pi * 1) * amp);
    }

    path.lineTo(size.width, size.height);
    path.lineTo(0.0, size.height);
    path.close();
    canvas.drawPath(path, wave2Paint);

    // draw big wave
    Paint wave1Paint = Paint()..color = fillColor;
    n = 2.2;
    amp = 10.0;

    path = Path();
    path.moveTo(0.0, baseHeight);
    for (double i = 0.0; i < size.width; i++) {
      path.lineTo(i, baseHeight + sin((i / size.width * 2 * pi * n) + (animation.value * 2 * pi)) * amp);
    }

    path.lineTo(size.width, size.height);
    path.lineTo(0.0, size.height);
    path.close();
    canvas.drawPath(path, wave1Paint);

    // draw border
    Paint borderPaint = Paint()
      ..color = borderColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4;

    canvas.drawCircle(size.center(Offset.zero), size.width / 2, borderPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}

class CircleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    return Path()..addOval(Rect.fromCircle(center: Offset(size.width / 2, size.height / 2), radius: size.width / 2));
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
