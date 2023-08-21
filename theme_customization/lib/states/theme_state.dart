import 'package:flutter/material.dart';

class ThemeState extends ChangeNotifier {
  var _isDarkTheme = false;
  var _isCustomTheme = false;

  bool get isDarkTheme => _isDarkTheme;
  set isDarkTheme(bool isDarkTheme) {
    _isCustomTheme = false;
    _isDarkTheme = isDarkTheme;
    notifyListeners();
  }

  bool get isCustomTheme => _isCustomTheme;
  set isCustomTheme(bool isCustomTheme) {
    _isCustomTheme = isCustomTheme;
    notifyListeners();
  }
}
