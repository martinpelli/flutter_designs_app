import 'package:flutter/material.dart';
import 'package:flutter_designs_app/widgets/slideshow.dart';
import 'package:flutter_svg/svg.dart';

class SlideshowPage extends StatelessWidget {
  const SlideshowPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Slideshow(
        dotColor: Colors.yellow,
        backgrounDotColor: Colors.black,
        selectedDotsize: 18,
        slides: [
          SvgPicture.asset('assets/slide1.svg'),
          SvgPicture.asset('assets/slide2.svg'),
          SvgPicture.asset('assets/slide3.svg'),
          SvgPicture.asset('assets/slide4.svg'),
          SvgPicture.asset('assets/slide5.svg')
        ],
      ),
    );
  }
}
