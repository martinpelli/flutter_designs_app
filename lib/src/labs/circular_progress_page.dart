import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

class CircularProgressPage extends StatefulWidget {
  const CircularProgressPage({super.key});

  @override
  State<CircularProgressPage> createState() => _CircularProgressPageState();
}

class _CircularProgressPageState extends State<CircularProgressPage> with TickerProviderStateMixin {
  late AnimationController controller;

  double percent = 0.0;
  double newPercent = 0.0;

  @override
  void initState() {
    controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 600));

    controller.addListener(() {
      setState(() {
        percent = lerpDouble(percent, newPercent, controller.value)!;
      });
    });

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.pink,
        onPressed: () {
          setState(() {
            percent = newPercent;
            newPercent += 10;
            controller.forward(from: 0.0);
          });

          if (newPercent > 100) {
            newPercent = 0;
            percent = 0;
          }
        },
        child: const Icon(Icons.refresh),
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(5.0),
          width: 300,
          height: 300,
          // color: Colors.red,
          child: CustomPaint(
            painter: _RadialProgress(percent),
          ),
        ),
      ),
    );
  }
}

class _RadialProgress extends CustomPainter {
  final double percent;

  _RadialProgress(this.percent);

  @override
  void paint(Canvas canvas, Size size) {
    final circlePaint = Paint()
      ..strokeWidth = 4
      ..color = Colors.grey
      ..style = PaintingStyle.stroke;

    Offset center = Offset(size.width * 0.5, size.height / 2);
    double radius = min(size.width * 0.5, size.height * 0.5);

    canvas.drawCircle(center, radius, circlePaint);

    final arcPaint = Paint()
      ..strokeWidth = 10
      ..color = Colors.pink
      ..style = PaintingStyle.stroke;

    double arcAngle = 2 * pi * (percent / 100);
    canvas.drawArc(Rect.fromCircle(center: center, radius: radius), -pi / 2, arcAngle, false, arcPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
