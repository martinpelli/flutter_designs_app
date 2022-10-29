import 'package:flutter/material.dart';

class ThemeChangerProvider with ChangeNotifier {
  bool _darkTheme = false;
  bool _customTheme = false;

  ThemeData _currentTheme = ThemeData.light();

  ThemeChangerProvider(int theme) {
    switch (theme) {
      case 1:
        _darkTheme = false;
        _customTheme = false;
        _currentTheme = ThemeData.light();
        break;
      case 2:
        _darkTheme = true;
        _customTheme = false;
        _currentTheme = ThemeData.dark().copyWith(colorScheme: ThemeData.dark().colorScheme.copyWith(secondary: Colors.pink));
        break;
      case 3:
        _darkTheme = false;
        _customTheme = true;
        break;
    }
  }

  bool get darkTheme => _darkTheme;
  set darkTheme(bool value) {
    _customTheme = false;
    _darkTheme = value;

    if (value)
      _currentTheme = ThemeData.dark().copyWith(colorScheme: ThemeData.dark().colorScheme.copyWith(secondary: Colors.pink));
    else
      _currentTheme = ThemeData.light();

    notifyListeners();
  }

  bool get customTheme => _customTheme;
  set customTheme(bool value) {
    _darkTheme = false;
    _customTheme = value;

    if (value)
      _currentTheme = ThemeData.dark().copyWith(
          colorScheme: ThemeData.dark().colorScheme.copyWith(secondary: Colors.pink),
          primaryColorLight: Colors.white,
          scaffoldBackgroundColor: Color(0xff162028),
          textTheme: TextTheme(bodyText1: TextStyle(color: Colors.white)));
    else
      _currentTheme = ThemeData.light();

    notifyListeners();
  }

  ThemeData get currentTheme => _currentTheme;
}
