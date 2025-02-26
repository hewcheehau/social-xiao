


import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_learn/provide.dart';
import 'package:test_learn/theme.dart';

void main() {
  runApp(MyApp());
}



class MyApp extends StatelessWidget {
  MyApp({super.key});

  final theme = ThemeSwitch();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              SizedBox(
                child: Text('a'),
              ),
              Container(
                child: ListenableBuilder(
                  listenable: theme,
                  builder: (context, _) {
                    return Switch(value: theme.isDark, onChanged: (_) => theme.switchTheme());
                  }
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}



class _MyWidgetFulState extends StatefulWidget {
  const _MyWidgetFulState({super.key});

  @override
  State<_MyWidgetFulState> createState() => __MyWidgetFulStateState();
}

class __MyWidgetFulStateState extends State<_MyWidgetFulState> {
  @override
  Widget build(BuildContext context) {
    return  Container();
  }
}


class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}