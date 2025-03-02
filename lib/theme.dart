import 'package:flutter/material.dart';

///@author hew
///Used to learn the [Listenable] and [ChangeNotifier] classes
///To implement a simple state change
///[ValueListenableBuilder] T rebuild when value change and optomized for performance, simple value update
///final ValueNotifier<int> counter = ValueNotifier<int>(0);
///[ListenableBuilder] T rebuild when listenable change, more complex value update , use notifyListeners(), less optimized

class ThemeSwitch extends ChangeNotifier {

  bool _isDark = false;

  bool get isDark => _isDark;


  void switchTheme() {
    _isDark = ! _isDark;
    notifyListeners();
  }

  ThemeData get theme => _isDark ? ThemeData.dark() : ThemeData.light();

}