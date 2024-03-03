import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_theory/screens/10_transition_screen_1.dart';
import 'package:go_router_theory/screens/10_transition_screen_2.dart';
import 'package:go_router_theory/screens/1_basic_screen.dart';
import 'package:go_router_theory/screens/2_named_screen.dart';
import 'package:go_router_theory/screens/3_push_screen.dart';
import 'package:go_router_theory/screens/4_pop_base_screen.dart';
import 'package:go_router_theory/screens/5_pop_return_screen.dart';
import 'package:go_router_theory/screens/6_path_param_screen.dart';
import 'package:go_router_theory/screens/7_query_parameter.dart';
import 'package:go_router_theory/screens/8_nested_child_screen.dart';
import 'package:go_router_theory/screens/8_nested_screen.dart';
import 'package:go_router_theory/screens/9_login_screen.dart';
import 'package:go_router_theory/screens/9_private_screen.dart';
import 'package:go_router_theory/screens/root_screen.dart';

// 로그인 여부
bool authState = false;

final router = GoRouter(
  redirect: (context, state) {
    // return string -> 해당 route 로 이동 (path)
    // return null -> 원래 이동 하려던 route 로 이동
    if (state.location == '/login/private' && !authState) {
      return '/login';
    }
    return null;
  },
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
        ShellRoute(
          builder: (context, state, child) {
            return NestedScreen(child: child);
          },
          routes: [
            GoRoute(
              // /nested/a
              path: 'nested/a',
              builder: (context, state) =>
                  NestedChildScreen(routeName: 'nested/a'),
            ),
            GoRoute(
              // /nested/b
              path: 'nested/b',
              builder: (context, state) =>
                  NestedChildScreen(routeName: 'nested/b'),
            ),
            GoRoute(
              // /nested/c
              path: 'nested/c',
              builder: (context, state) =>
                  NestedChildScreen(routeName: 'nested/c'),
            ),
          ],
        ),
        GoRoute(
          path: 'login',
          builder: (context, state) => LoginScreen(),
          routes: [
            GoRoute(
              path: 'private',
              builder: (context, state) => PrivateScreen(),
            ),
          ],
        ),
        GoRoute(
          path: 'login2',
          builder: (context, state) => LoginScreen(),
          routes: [
            GoRoute(
              path: 'private',
              builder: (context, state) => PrivateScreen(),
              redirect: (context, state) {
                if (!authState) {
                  return '/login2';
                }
                return null;
              },
            ),
          ],
        ),
        GoRoute(
          path: 'transition',
          builder: (context, state) => TransitionScreenOne(),
          routes: [
            GoRoute(
              path: 'detail',
              pageBuilder: (context, state) => CustomTransitionPage(
                child: TransitionScreenTwo(),
                transitionDuration: Duration(seconds: 3),
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
                  return RotationTransition(
                    turns: animation,
                    child: child,
                  );
                  // return FadeTransition(
                  //   opacity: animation,
                  //   child: child,
                  // );
                  // return ScaleTransition(
                  //   scale: animation,
                  //   child: child,
                  // );
                },
              ),
            ),
          ],
        ),
      ],
    ),
  ],
);
