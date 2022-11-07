import 'package:flutter/material.dart';
import 'package:flutter_designs_app/src/labs/slideshow_page.dart';

class LayoutProvider with ChangeNotifier {
  Widget _currentPage = SlideshowPage();

  set currentPage(Widget page) {
    _currentPage = page;
    notifyListeners();
  }

  Widget get currentPage => _currentPage;
}
