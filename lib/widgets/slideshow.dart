import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Slideshow extends StatelessWidget {
  final List<Widget> slides;
  final bool upperDots;
  final Color dotColor;
  final Color backgrounDotColor;
  final double selectedDotsize;
  final double dotSize;

  const Slideshow(
      {super.key,
      required this.slides,
      this.upperDots = false,
      required this.dotColor,
      required this.backgrounDotColor,
      this.selectedDotsize = 12,
      this.dotSize = 12});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => _SlideProvider(dotColor: dotColor, backgrounDotColor: backgrounDotColor, selectedDotsize: selectedDotsize, dotSize: dotSize),
        child: SafeArea(
          child: Column(
            children: [
              if (upperDots)
                _Dots(
                  amount: slides.length,
                ),
              Expanded(child: _Slides(slides)),
              if (!upperDots) _Dots(amount: slides.length)
            ],
          ),
        ));
  }
}

class _Slides extends StatefulWidget {
  final List<Widget> slides;
  const _Slides(this.slides, {Key? key}) : super(key: key);

  @override
  State<_Slides> createState() => _SlidesState();
}

class _SlidesState extends State<_Slides> {
  final PageController pageController = PageController();

  @override
  void initState() {
    pageController.addListener(() {
      Provider.of<_SlideProvider>(context, listen: false).currentPage = pageController.page!;
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
      child: PageView(controller: pageController, children: widget.slides.map((slide) => _Slide(slide: slide)).toList()),
    );
  }
}

class _Slide extends StatelessWidget {
  final Widget slide;

  const _Slide({
    Key? key,
    required this.slide,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(width: double.infinity, height: double.infinity, padding: const EdgeInsets.all(10.0), child: slide);
  }
}

class _Dots extends StatelessWidget {
  final int amount;
  const _Dots({Key? key, required this.amount}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 70,
      child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        for (int i = 0; i < amount; i++) ...[_Dot(index: i)]
      ]),
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
    final slideProvider = Provider.of<_SlideProvider>(context);
    final bool isSelectedPage = (slideProvider.currentPage >= index - 0.5 && slideProvider.currentPage < index + 0.5);

    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      width: isSelectedPage ? slideProvider.selectedDotsize : slideProvider.dotSize,
      height: isSelectedPage ? slideProvider.selectedDotsize : slideProvider.dotSize,
      margin: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(color: (isSelectedPage) ? slideProvider.dotColor : slideProvider.backgrounDotColor, shape: BoxShape.circle),
    );
  }
}

class _SlideProvider with ChangeNotifier {
  double _currentPage = 0;
  Color? _dotColor;
  Color? _backgrounDotColor;
  double? _selectedDotsize;
  double? _dotSize;

  _SlideProvider({Color? dotColor, Color? backgrounDotColor, double? selectedDotsize, double? dotSize}) {
    this.dotColor = dotColor;
    this.backgrounDotColor = backgrounDotColor;
    this.selectedDotsize = selectedDotsize;
    this.dotSize = dotSize;
  }

  double get currentPage => _currentPage;

  set currentPage(double currentPage) {
    _currentPage = currentPage;
    notifyListeners();
  }

  Color? get dotColor => _dotColor;

  set dotColor(Color? color) {
    _dotColor = color;
  }

  Color? get backgrounDotColor => _backgrounDotColor;

  set backgrounDotColor(Color? color) {
    _backgrounDotColor = color;
  }

  double? get selectedDotsize => _selectedDotsize;

  set selectedDotsize(double? size) {
    _selectedDotsize = size;
  }

  double? get dotSize => _dotSize;

  set dotSize(double? size) {
    _selectedDotsize = size;
  }
}
