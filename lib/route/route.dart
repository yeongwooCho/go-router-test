import 'package:go_router/go_router.dart';
import 'package:go_router_theory/screens/root_screen.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/', // home
      builder: (context, state) {
        return RootScreen();
      },
    ),
  ],
);
