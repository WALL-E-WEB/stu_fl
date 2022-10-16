import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:stufl/page/home.dart';
import 'package:stufl/page/login.dart';

import 'page/detail.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginPage(),
    );
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routeInformationParser: MyRouteParser(),
      routerDelegate: MyRouteDelegate(
        onGenerateRoute: (settings) {
          return MaterialPageRoute(
            settings: settings,
            builder: ((context) {
              return const HomePage();
            }),
          );
        },
      ),
    );
  }
}

class MyRouteDelegate extends RouterDelegate<String>
    with PopNavigatorRouterDelegateMixin<String>, ChangeNotifier {
  final _stack = <String>[];

  static MyRouteDelegate of(BuildContext context) {
    final delegate = Router.of(context).routerDelegate;
    assert(delegate is MyRouteDelegate, 'Delegate type must match');
    return delegate as MyRouteDelegate;
  }

  MyRouteDelegate({
    required this.onGenerateRoute,
  });

  final RouteFactory onGenerateRoute;

  @override
  GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  @override
  String? get currentConfiguration => _stack.isNotEmpty ? _stack.last : null;

  List<String> get stack => List.unmodifiable(_stack);

  void toName(String newRoute) {
    _stack.add(newRoute);
    notifyListeners();
  }

  void push(String newRoute) {
    _stack.add(newRoute);
    notifyListeners();
  }

  void remove(String routeName) {
    _stack.remove(routeName);
    notifyListeners();
  }

  void pop() {
    _stack.remove(_stack.last);
    notifyListeners();
  }

  bool _onPopPage(Route<dynamic> route, dynamic result) {
    if (_stack.isNotEmpty) {
      if (_stack.last == route.settings.name) {
        _stack.remove(route.settings.name);
        notifyListeners();
      }
    }
    return route.didPop(result);
  }

  @override
  Future<void> setInitialRoutePath(String configuration) {
    return setNewRoutePath(configuration);
  }

  @override
  Future<void> setNewRoutePath(String configuration) {
    _stack
      ..clear()
      ..add(configuration);
    return SynchronousFuture<void>(null);
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      onPopPage: _onPopPage,
      initialRoute: '/',
      onGenerateRoute: (settings) {
        return MaterialPageRoute(
          settings: settings,
          builder: ((context) {
            return const HomePage();
          }),
        );
      },
      pages: [
        for (final name in _stack)
          MyPage(
            key: ValueKey(name),
            name: name,
            builder: routerNames[name] as Widget Function(BuildContext),
          ),
      ],
    );
  }
}

final routerNames = {
  "/": (context) => const HomePage(),
  "/login": (context) => const LoginPage(),
};

class MyPage<T> extends Page<T> {
  const MyPage({
    required LocalKey key,
    required String name,
    required this.builder,
  }) : super(key: key, name: name);

  final WidgetBuilder builder;

  @override
  Route<T> createRoute(BuildContext context) {
    return MaterialPageRoute(
      settings: this,
      builder: builder,
    );
  }

  @override
  String toString() => '$name';
}

class MyRouteParser extends RouteInformationParser<String> {
  // 接受系统传递给我们的路由信息 routeInformation，然后，返回转发给我们之前定义的路由代理 RouterDelegate，
  // 解析后的类型为 RouteInformationParser 的泛型类型，即这里的 String
  @override
  Future<String> parseRouteInformation(RouteInformation routeInformation) {
    var location = routeInformation.location;
    return SynchronousFuture(location!);
  }

  // 返回一个 RouteInformation 对象，表示从传入的 configuration 恢复路由信息。
  @override
  RouteInformation restoreRouteInformation(String configuration) {
    return RouteInformation(location: configuration);
  }
}
