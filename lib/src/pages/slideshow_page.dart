import 'package:flutter/material.dart';
import 'package:flutter_designs_app/src/providers/theme_changer_provider.dart';
import 'package:flutter_designs_app/widgets/slideshow.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class SlideshowPage extends StatelessWidget {
  const SlideshowPage({super.key});

  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChangerProvider>(context);
    return Scaffold(
      body: Slideshow(
        dotColor: (appTheme.darkTheme) ? appTheme.currentTheme.colorScheme.secondary : Colors.yellow,
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
