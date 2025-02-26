


import 'package:flutter/material.dart';

class CounterProvider extends InheritedWidget {

  final int counter;
  final VoidCallback increment;

  const CounterProvider({super.key, required super.child, required this.counter, required this.increment});

  static CounterProvider? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType();
  }

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    print("change now.");
    return oldWidget != this;
  }

}