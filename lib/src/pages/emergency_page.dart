import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_designs_app/widgets/button_card.dart';
import 'package:flutter_designs_app/widgets/headers.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class EmergencyPage extends StatelessWidget {
  EmergencyPage({super.key});

  final items = [
    FadeInLeft(
        child:
            ButtonCard(icon: FontAwesomeIcons.carBurst, text: 'Motor Accident', primaryColor: Color(0xff6989F5), secondaryColor: Color(0xff906EF5))),
    FadeInLeft(
        child:
            ButtonCard(icon: FontAwesomeIcons.plus, text: 'Medical Emergency', primaryColor: Color(0xff66A9F2), secondaryColor: Color(0xff536CF6))),
    FadeInLeft(
        child: ButtonCard(
            icon: FontAwesomeIcons.masksTheater, text: 'Theft / Harrasement', primaryColor: Color(0xffF2D572), secondaryColor: Color(0xffE06AA3))),
    FadeInLeft(
        child: ButtonCard(icon: FontAwesomeIcons.personBiking, text: 'Awards', primaryColor: Color(0xff317183), secondaryColor: Color(0xff46997D))),
    FadeInLeft(
        child:
            ButtonCard(icon: FontAwesomeIcons.carBurst, text: 'Motor Accident', primaryColor: Color(0xff6989F5), secondaryColor: Color(0xff906EF5))),
    FadeInLeft(
        child:
            ButtonCard(icon: FontAwesomeIcons.plus, text: 'Medical Emergency', primaryColor: Color(0xff66A9F2), secondaryColor: Color(0xff536CF6))),
    FadeInLeft(
        child: ButtonCard(
            icon: FontAwesomeIcons.masksTheater, text: 'Theft / Harrasement', primaryColor: Color(0xffF2D572), secondaryColor: Color(0xffE06AA3))),
    FadeInLeft(
        child: ButtonCard(icon: FontAwesomeIcons.personBiking, text: 'Awards', primaryColor: Color(0xff317183), secondaryColor: Color(0xff46997D))),
    FadeInLeft(
        child:
            ButtonCard(icon: FontAwesomeIcons.carBurst, text: 'Motor Accident', primaryColor: Color(0xff6989F5), secondaryColor: Color(0xff906EF5))),
    FadeInLeft(
        child:
            ButtonCard(icon: FontAwesomeIcons.plus, text: 'Medical Emergency', primaryColor: Color(0xff66A9F2), secondaryColor: Color(0xff536CF6))),
    FadeInLeft(
        child: ButtonCard(
            icon: FontAwesomeIcons.masksTheater, text: 'Theft / Harrasement', primaryColor: Color(0xffF2D572), secondaryColor: Color(0xffE06AA3))),
    FadeInLeft(
        child: ButtonCard(icon: FontAwesomeIcons.personBiking, text: 'Awards', primaryColor: Color(0xff317183), secondaryColor: Color(0xff46997D))),
  ];

  @override
  Widget build(BuildContext context) {
    final bool isLarge = MediaQuery.of(context).size.height > 550;
    return Scaffold(
        body: Stack(
      children: [
        Container(
          margin: EdgeInsets.only(top: isLarge ? 220 : 10),
          child: ListView(physics: const BouncingScrollPhysics(), children: [if (isLarge) const SizedBox(height: 80), ...items]),
        ),
        if (isLarge) const _PageHeader()
      ],
    ));
  }
}

class _PageHeader extends StatelessWidget {
  const _PageHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconHeader(
      icon: FontAwesomeIcons.plus,
      title: 'Haz solicitado',
      subTitle: 'Asistencia Médica',
      primaryColor: Color(0xff526BF6),
      secondaryColor: Color(0xff67ACF2),
    );
  }
}
