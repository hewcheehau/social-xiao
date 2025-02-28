import 'dart:math';

import 'package:flutter/material.dart';
import 'package:test_learn/widget/user_profile_state.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    print("building myapp");
    return MaterialApp(
      home: _HomePage(),
    );
  }
}

class _HomePage extends StatefulWidget {
  const _HomePage({super.key});

  @override
  State<_HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<_HomePage> {
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
    print("building home");
    return Scaffold(
      appBar: AppBar(
        title: const Text('InheritedWidget'),
      ),
      body: UserProfileState(
          child: SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
            children: [
              HeaderWidget(),
              Expanded(
                child: UserView(),
              ),
              BottomWidget(),
              Spacer(flex: 1,),
            ],
          )),
          name: _userName,
          updateName: _changeUserName),
    );
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
