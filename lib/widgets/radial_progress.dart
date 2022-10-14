import 'dart:math';

import 'package:flutter/material.dart';

class RadialProgress extends StatefulWidget {
  final double percent;
  final Color strokeColor;
  final Color backColor;
  final double strokeWidth;
  final double backWidth;

  const RadialProgress(
      {super.key, required this.percent, this.strokeColor = Colors.blue, this.backColor = Colors.grey, this.strokeWidth = 10, this.backWidth = 4});

  @override
  State<RadialProgress> createState() => _RadialProgressState();
}

class _RadialProgressState extends State<RadialProgress> with TickerProviderStateMixin {
  late AnimationController controller;
  double previousPercent = 0.0;

  @override
  void initState() {
    previousPercent = widget.percent;
    controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 400));
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    controller.forward(from: 0.0);

    final double differenceToAnimate = widget.percent - previousPercent;
    previousPercent = widget.percent;

    return AnimatedBuilder(
        animation: controller,
        builder: (BuildContext context, Widget? child) {
          return Container(
            padding: const EdgeInsets.all(10),
            width: double.infinity,
            height: double.infinity,
            child: CustomPaint(
              painter: _RadialProgress((widget.percent - differenceToAnimate) + (differenceToAnimate * controller.value), widget.strokeColor,
                  widget.backColor, widget.strokeWidth, widget.backWidth),
            ),
          );
        });
  }
}

class _RadialProgress extends CustomPainter {
  final double percent;
  final Color strokeColor;
  final Color backColor;
  final double strokeWidth;
  final double backWidth;

  _RadialProgress(this.percent, this.strokeColor, this.backColor, this.strokeWidth, this.backWidth);

  @override
  void paint(Canvas canvas, Size size) {
    final circlePaint = Paint()
      ..strokeWidth = backWidth
      ..color = backColor
      ..style = PaintingStyle.stroke;

    Offset center = Offset(size.width * 0.5, size.height / 2);
    double radius = min(size.width * 0.5, size.height * 0.5);

    canvas.drawCircle(center, radius, circlePaint);

    final arcPaint = Paint()
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round
      ..color = strokeColor
      ..style = PaintingStyle.stroke;

    double arcAngle = 2 * pi * (percent / 100);
    canvas.drawArc(Rect.fromCircle(center: center, radius: radius), -pi / 2, arcAngle, false, arcPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
