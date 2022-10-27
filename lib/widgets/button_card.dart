import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ButtonCard extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color primaryColor;
  final Color secondaryColor;
  final void Function()? onPressed;

  const ButtonCard({super.key, required this.icon, required this.text, required this.primaryColor, required this.secondaryColor, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Stack(
        children: [
          _ButtonCardBackground(primaryColor: primaryColor, secondaryColor: secondaryColor),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 140, width: 40),
              FaIcon(icon, color: Colors.white, size: 40),
              const SizedBox(width: 20),
              Expanded(
                child: Text(
                  text,
                  style: const TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
              const FaIcon(FontAwesomeIcons.chevronRight, color: Colors.white),
              const SizedBox(width: 40),
            ],
          )
        ],
      ),
    );
  }
}

class _ButtonCardBackground extends StatelessWidget {
  final Color primaryColor;
  final Color secondaryColor;

  const _ButtonCardBackground({
    Key? key,
    required this.primaryColor,
    required this.secondaryColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100,
      margin: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.2), offset: const Offset(4, 6), blurRadius: 10)],
          borderRadius: BorderRadius.circular(15),
          gradient: LinearGradient(colors: [primaryColor, secondaryColor])),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Stack(children: [
          Positioned(
              right: -20,
              top: -20,
              child: FaIcon(
                FontAwesomeIcons.carBurst,
                color: Colors.white.withOpacity(0.2),
                size: 150,
              ))
        ]),
      ),
    );
  }
}
