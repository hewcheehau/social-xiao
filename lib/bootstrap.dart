import 'dart:math';

import 'package:flutter/material.dart';
import 'package:test_learn/widgets/user_profile_state.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    print("building myapp");
    return UserStateWidget(
      child: MaterialApp(
        home: _HomePage(),
      ),
    );
  }
}

class _HomePage extends StatefulWidget {
  const _HomePage({super.key});

  @override
  State<_HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<_HomePage> {
  @override
  Widget build(BuildContext context) {
    print("building home");
    return Scaffold(
      appBar: AppBar(
        title: const Text('InheritedWidget'),
      ),
      body: _BodyView(),
    );
  }
}

class _BodyView extends StatelessWidget {
  const _BodyView();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        HeaderWidget(),
        Expanded(
          child: UserView(),
        ),
        BottomWidget(),
        Spacer(
          flex: 1,
        ),
      ],
    ));
  }
}

class BottomWidget extends StatelessWidget {
  const BottomWidget({super.key});

  @override
  Widget build(BuildContext context) {
    print("building bottom");

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.blue),
      ),
      child: Text('登录：'),
    );
  }
}

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    String? userName = UserProfileState.of(context)?.name;
    print("building header");

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.blue),
      ),
      child: Text('登录：$userName'),
    );
  }
}

class UserView extends StatefulWidget {
  const UserView({super.key});

  @override
  State<UserView> createState() => _UserViewState();
}

class _UserViewState extends State<UserView> {
  String? _userName;

  @override
  void didChangeDependencies() {
    print("did change dependencies");
    _userName = UserProfileState.of(context)?.name;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    print("building userview");
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.purple),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('用户名：$_userName'),
          ElevatedButton(
            onPressed: () {
              // 随机 10 个字母
              String randomString = String.fromCharCodes(
                List.generate(
                  10,
                  (index) => 97 + Random().nextInt(26),
                ),
              );

              // 改变用户名
              UserProfileState.of(context)?.updateName(randomString);
            },
            child: const Text('改变名称'),
          ),
        ],
      ),
    );
  }
}

class UserStateWidget extends StatefulWidget {
  const UserStateWidget({super.key, required this.child});
  final Widget child;
  @override
  State<UserStateWidget> createState() => _UserStateWidgetState();
}

class _UserStateWidgetState extends State<UserStateWidget> {
  // 用户名
  String _userName = '未登录';

  // 修改用户名
  void _changeUserName(String userName) {
    setState(() {
      _userName = userName;
    });
  }

  @override
  Widget build(BuildContext context) {
    print("rebuilding user state");
    return UserProfileState(
      name: _userName,
      updateName: _changeUserName,
      child: widget.child,
    );
  }
}
