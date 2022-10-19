import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SlideshowPage extends StatelessWidget {
  const SlideshowPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [Expanded(child: _Slides()), _Dots()],
    ));
  }
}

class _Slides extends StatelessWidget {
  const _Slides({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: PageView(
        children: [_Slide(svg: 'assets/slide1.svg'), _Slide(svg: 'assets/slide2.svg'), _Slide(svg: 'assets/slide3.svg')],
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final String svg;

  const _Slide({
    Key? key,
    required this.svg,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(width: double.infinity, height: double.infinity, padding: EdgeInsets.all(10.0), child: SvgPicture.asset(svg));
  }
}

class _Dots extends StatelessWidget {
  const _Dots({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 70,
      child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [_Dot(), _Dot(), _Dot()]),
    );
  }
}

class _Dot extends StatelessWidget {
  const _Dot({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 12,
      height: 12,
      margin: EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(color: Colors.grey, shape: BoxShape.circle),
    );
  }
}
