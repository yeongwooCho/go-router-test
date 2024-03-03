import 'package:go_router/go_router.dart';
import 'package:go_router_theory/screens/1_basic_screen.dart';
import 'package:go_router_theory/screens/2_named_screen.dart';
import 'package:go_router_theory/screens/3_push_screen.dart';
import 'package:go_router_theory/screens/4_pop_base_screen.dart';
import 'package:go_router_theory/screens/5_pop_return_screen.dart';
import 'package:go_router_theory/screens/6_path_param_screen.dart';
import 'package:go_router_theory/screens/7_query_parameter.dart';
import 'package:go_router_theory/screens/root_screen.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      // / -> home
      path: '/',
      builder: (context, state) {
        return RootScreen();
      },
      routes: [
        GoRoute(
          // /basic
          path: 'basic',
          builder: (context, state) {
            return BasicScreen();
          },
        ),
        GoRoute(
          // /named
          path: 'named',
          name: 'named_screen',
          builder: (context, state) {
            return NamedScreen();
          },
        ),
        GoRoute(
          // /named
          path: 'push',
          builder: (context, state) {
            return PushScreen();
          },
        ),
        GoRoute(
          // /pop
          path: 'pop',
          builder: (context, state) {
            return PopBaseScreen();
          },
          routes: [
            GoRoute(
              // /pop/return
              path: 'return',
              builder: (context, state) {
                return PopReturnScreen();
              },
            )
          ],
        ),
        GoRoute(
          path: 'path_param/:id',
          builder: (context, state) {
            return PathParamScreen();
          },
          routes: [
            GoRoute(
              path: ':name',
              builder: (context, state) {
                return PathParamScreen();
              },
            )
          ],
        ),
        GoRoute(
          path: 'query_param',
          builder: (context, state) {
            return QueryParameterScreen();
          },
        ),
      ],
    ),
  ],
);
