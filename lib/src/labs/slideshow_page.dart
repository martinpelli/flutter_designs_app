import 'package:flutter/material.dart';
import 'package:flutter_designs_app/src/providers/slider_provider.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class SlideshowPage extends StatelessWidget {
  const SlideshowPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => SliderProvider(),
      child: Scaffold(
          body: Column(
        children: [Expanded(child: _Slides()), _Dots()],
      )),
    );
  }
}

class _Slides extends StatefulWidget {
  const _Slides({Key? key}) : super(key: key);

  @override
  State<_Slides> createState() => _SlidesState();
}

class _SlidesState extends State<_Slides> {
  final PageController pageController = PageController();

  @override
  void initState() {
    pageController.addListener(() {
      Provider.of<SliderProvider>(context, listen: false).currentPage = pageController.page!;
    });

    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: PageView(
        controller: pageController,
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
    return Container(width: double.infinity, height: double.infinity, padding: const EdgeInsets.all(10.0), child: SvgPicture.asset(svg));
  }
}

class _Dots extends StatelessWidget {
  const _Dots({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 70,
      child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [_Dot(index: 0), _Dot(index: 1), _Dot(index: 2)]),
    );
  }
}

class _Dot extends StatelessWidget {
  final int index;

  const _Dot({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final currentPageIndex = Provider.of<SliderProvider>(context).currentPage;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      width: 12,
      height: 12,
      margin: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
          color: (currentPageIndex >= index - 0.5 && currentPageIndex < index + 0.5) ? Colors.blue : Colors.grey, shape: BoxShape.circle),
    );
  }
}
