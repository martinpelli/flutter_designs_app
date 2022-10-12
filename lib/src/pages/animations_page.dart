import 'package:flutter/material.dart';
import 'dart:math' as Math;

class AnimationsPage extends StatelessWidget {
  const AnimationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: _AnimatedSquare()),
    );
  }
}

class _AnimatedSquare extends StatefulWidget {
  const _AnimatedSquare({
    Key? key,
  }) : super(key: key);

  @override
  State<_AnimatedSquare> createState() => _AnimatedSquareState();
}

class _AnimatedSquareState extends State<_AnimatedSquare> with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> rotation;
  late Animation<double> opacity;
  late Animation<double> move;
  late Animation<double> scale;

  @override
  void initState() {
    controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 4000));

    rotation = Tween(begin: 0.0, end: 2.0 * Math.pi).animate(CurvedAnimation(parent: controller, curve: Curves.easeInOutCirc));
    opacity = Tween(begin: 1.0, end: 0.0).animate(CurvedAnimation(parent: controller, curve: const Interval(0.75, 1.0, curve: Curves.easeOut)));
    move = Tween(begin: 0.0, end: 100.0).animate(CurvedAnimation(parent: controller, curve: Curves.easeInOutCirc));
    scale = Tween(begin: 0.0, end: 2.0).animate(CurvedAnimation(parent: controller, curve: Curves.easeInOutCirc));

    controller.forward();
    controller.addListener(() {
      if (controller.status == AnimationStatus.completed) {
        controller.reverse();
      }
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
    controller.forward();
    return AnimatedBuilder(
      animation: controller,
      child: _Rectangle(),
      builder: (BuildContext context, Widget? child) {
        return Transform.scale(
          scale: scale.value,
          child: Transform.translate(
              offset: Offset(move.value, 0), child: Transform.rotate(angle: rotation.value, child: Opacity(opacity: opacity.value, child: child))),
        );
      },
    );
  }
}

class _Rectangle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      height: 70,
      decoration: const BoxDecoration(color: Colors.blue),
    );
  }
}
