import 'package:go_router/go_router.dart';
import 'package:go_router_theory/screens/1_basic_screen.dart';
import 'package:go_router_theory/screens/root_screen.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/', // home
      builder: (context, state) {
        return RootScreen();
      },
      routes: [
        GoRoute(
          path: 'basic',
          builder: (context, state) {
            return BasicScreen();
          },
        ),
      ]
    ),
  ],
);
