import 'package:flutter/material.dart';

class AnimatedSquarePage extends StatelessWidget {
  const AnimatedSquarePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: _AnimatedSquare()));
  }
}

class _AnimatedSquare extends StatefulWidget {
  @override
  State<_AnimatedSquare> createState() => _AnimatedSquareState();
}

class _AnimatedSquareState extends State<_AnimatedSquare> with TickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> moveRight;
  late Animation<double> moveUp;
  late Animation<double> moveLeft;
  late Animation<double> moveDown;

  @override
  void initState() {
    controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 4000));

    moveRight = Tween(begin: 0.0, end: 50.0).animate(CurvedAnimation(parent: controller, curve: const Interval(0.0, 0.25, curve: Curves.bounceOut)));
    moveUp = Tween(begin: 0.0, end: -50.0).animate(CurvedAnimation(parent: controller, curve: const Interval(0.25, 0.5, curve: Curves.bounceOut)));
    moveLeft = Tween(begin: 0.0, end: -50.0).animate(CurvedAnimation(parent: controller, curve: const Interval(0.5, 0.75, curve: Curves.bounceOut)));
    moveDown = Tween(begin: 0.0, end: 50.0).animate(CurvedAnimation(parent: controller, curve: const Interval(0.75, 1.0, curve: Curves.bounceOut)));

    controller.forward();

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      child: _Rectangle(),
      builder: (BuildContext context, Widget? child) {
        return Transform.translate(
            offset: Offset(moveRight.value, 0),
            child: Transform.translate(
                offset: Offset(0, moveUp.value),
                child: Transform.translate(
                    offset: Offset(moveLeft.value, 0), child: Transform.translate(offset: Offset(0, moveDown.value), child: child))));
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
