import 'package:flutter/material.dart';

class ThemeSwitch extends ChangeNotifier {

  bool _isDark = false;

  bool get isDark => _isDark;


  void switchTheme() {
    _isDark = ! _isDark;
    notifyListeners();
  }

  ThemeData get theme => _isDark ? ThemeData.dark() : ThemeData.light();

}