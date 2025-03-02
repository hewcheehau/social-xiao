


import 'package:flutter/material.dart';

class UserProfileState extends InheritedWidget {

  final String name;
  final Function updateName;

  const UserProfileState({
    super.key,
    required super.child,
    required this.name, required this.updateName});

  static UserProfileState? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<UserProfileState>();
  }

  @override
  bool updateShouldNotify(UserProfileState oldWidget) {
    return name != oldWidget.name;
  }

}