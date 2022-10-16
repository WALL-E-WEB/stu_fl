import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:stufl/page/home.dart';
// final li = ModalRoute.of(context)!.overlayEntries;
// final arg =
//     ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

class LoginPage extends StatefulWidget {
  final String name;
  const LoginPage({super.key, this.name = ''});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  GlobalKey _key = GlobalKey();
  @override
  void initState() {
    super.initState();
    print('LoginPage - initState ');
  }

  @override
  void didChangeDependencies() {
    print('LoginPage - didChangeDependencies ');
    // AppLifecycleState
    super.didChangeDependencies();
  }

  @override
  void didUpdateWidget(covariant LoginPage oldWidget) {
    print('LoginPage - didUpdateWidget ');
    super.didUpdateWidget(oldWidget);
  }

  @override
  void deactivate() {
    print('LoginPage - deactivate ');
    super.deactivate();
  }

  @override
  void dispose() {
    print('LoginPage - dispose ');
    super.dispose();
  }

  List<Color> colorList = [Colors.white, Colors.black, Colors.red];

  @override
  Widget build(BuildContext context) {
    print('LoginPage - build ');
    return Scaffold(
      appBar: AppBar(title: const Text('login')),
      body: ListView(
        children: [
          ElevatedButton(
            key: _key,
            onPressed: () async {
              // Navigator.of(context).pushNamedAndRemoveUntil(
              //     '/home', (route) => true,
              //     arguments: {'id': 2});
              // Navigator.of(context).pushNamed(
              //   '/home',
              //   arguments: {'id': 2},

              // );

              setState(() {});
              // print(_key.currentContext);

              // Navigator.of(context).push(MaterialPageRoute(
              //   builder: (c) {
              //     return LoginPage();
              //   },
              //   settings: RouteSettings(name: 'ddd', arguments: {'id': 2}),
              //   maintainState: true,
              //   // fullscreenDialog: true,
              // ));
            },
            child: Text('to home${widget.name}'),
          ),
          Box(color: Colors.black, key: ValueKey(2)),
          Box(color: Colors.white, key: ValueKey(1)),
          Box(color: Colors.red, key: ValueKey(3)),
          Center(
            child: Container(
              // height: 100,
              // width: 100,
              constraints: BoxConstraints(
                maxHeight: 200,
                minHeight: 100,
                maxWidth: 200,
              ),
              alignment: Alignment.center,
              foregroundDecoration: BoxDecoration(
                color: Colors.black26,
                border: Border.all(
                  width: 20,
                  color: Colors.black12,
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.red,
                border: Border.all(
                  width: 2,
                  color: Colors.black,
                ),
                // borderRadius: BorderRadius.all(
                //   Radius.elliptical(50, 30),
                // ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.deepOrange,
                    blurRadius: 10,
                    blurStyle: BlurStyle.normal,
                    spreadRadius: 20,
                  )
                ],
                gradient: SweepGradient(
                  colors: [
                    Colors.red,
                    Colors.blue,
                  ],
                ),
                backgroundBlendMode: BlendMode.lighten,
                shape: BoxShape.rectangle,
              ),

              child: Container(
                height: 50,
                width: 50,
                color: Colors.blue,
                child: Text('2'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Box extends StatefulWidget {
  final Color color;
  const Box({super.key, required this.color});

  @override
  State<Box> createState() => _BoxState();
}

class _BoxState extends State<Box> {
  int _count = 1;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          _count++;
        });
        Fluttertoast.showToast(msg: 'dddd2');
      },
      child: Text(
        '$_count',
        style: TextStyle(color: widget.color),
      ),
    );
  }
}
