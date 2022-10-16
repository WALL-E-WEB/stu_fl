import 'package:flutter/material.dart';
import 'package:stufl/main.dart';

import 'login.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    print('HomePage - initState ');
  }

  @override
  void didChangeDependencies() {
    print('HomePage - didChangeDependencies ');
    super.didChangeDependencies();
  }

  @override
  void didUpdateWidget(covariant HomePage oldWidget) {
    print('HomePage - didUpdateWidget ');
    super.didUpdateWidget(oldWidget);
  }

  @override
  void deactivate() {
    print('HomePage - deactivate ');
    super.deactivate();
  }

  @override
  void dispose() {
    print('HomePage - dispose ');
    super.dispose();
  }

  bool isShow = true;
  @override
  Widget build(BuildContext context) {
    print('HomePage - build ');
    return Scaffold(
      appBar: AppBar(
        title: isShow ? Text('home-') : Text('data'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {},
          child: LoginPage(
            name: isShow ? '1' : '2',
          ),
        ),
      ),
      floatingActionButton: ElevatedButton(
        onPressed: () {
          setState(() {
            isShow = !isShow;
          });
        },
        child: Text('data'),
      ),
    );
  }
}
