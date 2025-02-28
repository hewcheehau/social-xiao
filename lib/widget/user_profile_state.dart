


import 'package:flutter/material.dart';

class UserProfileState extends InheritedWidget {

  final String name;
  final Function updateName;
  final Widget child;

  const UserProfileState({
    super.key,
    required this.child,
    required this.name, required this.updateName}):super(child: child);

  static UserProfileState? of(BuildContext context) {
    final userProfile = context.dependOnInheritedWidgetOfExactType<UserProfileState>();
    return userProfile;
  }

  @override
  bool updateShouldNotify(UserProfileState oldWidget) {
    return name != oldWidget.name;
  }

}