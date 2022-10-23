import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_playground/custom_slider.dart';
import 'package:go_router_playground/router/home_route.dart';
import 'package:go_router_playground/router/login_route.dart';
import 'package:go_router_playground/router/settings_route.dart';
import 'package:go_router_playground/router_observer.dart';
import 'package:go_router_playground/scaffold_error.dart';
import 'package:go_router_playground/scaffold_with_bottom_nav_bar.dart';
import 'package:go_router_playground/service_locator.dart';

final rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');
final shellNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'shell');

final router = GoRouter(
  initialLocation: '/',
  navigatorKey: rootNavigatorKey,
  debugLogDiagnostics: true,
  redirect: _onRedirect,
  refreshListenable: loginProviderLogic,
  routerNeglect: false,
  routes: [
    loginRoute,
    ShellRoute(
      navigatorKey: shellNavigatorKey,
      builder: (_, __, child) {
        return ScaffoldWithBottomNavBar(tabs: tabs, child: child);
      },
      routes: [
        GoRoute(
          path: '/',
          redirect: (_, __) => '/home',
        ),
        homeRoute,
        settingsRoute,
      ],
    ),
  ],
  errorPageBuilder: (_, state) {
    return CustomSlideTransition(
      key: state.pageKey,
      child: ScaffoldError(message: state.error.toString()),
    );
  },
  observers: [
    MyNavObserver(),
  ],
);

final tabs = [
  const ScaffoldWithNavBarTabItem(
    initialLocation: '/home',
    icon: Icon(Icons.home),
    label: 'Home',
  ),
  const ScaffoldWithNavBarTabItem(
    initialLocation: '/settings',
    icon: Icon(Icons.settings),
    label: 'Settings',
  ),
];

String? _onRedirect(BuildContext context, GoRouterState state) {
  // Checks if the user is logged in
  final loggedIn = loginProviderLogic.isLoggedIn;
  // Get's the login location
  final loginLoc = state.namedLocation('login');
  // Checks if the user is going to the login location
  final loggingIn = state.subloc == loginLoc;

  final isLoginPage = state.location == '/login';
  final isHomePage = state.location == '/home';
  final isSettingsPage = state.location == '/settings/settings_tab_a';

  if (loggedIn && isLoginPage) return '/home';

  print('____loginLoc: $loginLoc');
  print('____loggedIn: $loggedIn');
  print('____subloc: ${state.subloc}');
  print('____loggingIn: $loggingIn');

  //if (!loggedIn && isLoginPage) return '/login';
  //if (loggedIn && loggingIn) return '/home';
  return null;
}
