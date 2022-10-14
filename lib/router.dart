import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_playground/details_page.dart';
import 'package:go_router_playground/settings/index.dart';
import 'package:go_router_playground/settings/settings_page.dart';
import 'package:go_router_playground/home_page.dart';
import 'package:go_router_playground/router_observer.dart';
import 'package:go_router_playground/scaffold_with_bottom_nav_bar.dart';

const home = HomePage.routeName;
const details = DetailsPage.routeName;
const settings = SettingsPage.routeName;

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();

final tabs = [
  const ScaffoldWithNavBarTabItem(
    initialLocation: '/$home',
    icon: Icon(Icons.home),
    label: 'Home',
  ),
  const ScaffoldWithNavBarTabItem(
    initialLocation: '/$settings',
    icon: Icon(Icons.settings),
    label: 'Settings',
  ),
];

final router = GoRouter(
  initialLocation: '/',
  navigatorKey: _rootNavigatorKey,
  debugLogDiagnostics: true,
  routes: [
    ShellRoute(
      navigatorKey: _shellNavigatorKey,
      builder: (_, __, child) {
        return ScaffoldWithBottomNavBar(tabs: tabs, child: child);
      },
      routes: [
        GoRoute(
          path: '/',
          redirect: (_, __) => '/$home',
        ),
        GoRoute(
          name: home,
          path: '/$home',
          pageBuilder: (_, state) {
            return NoTransitionPage(
              key: state.pageKey,
              child: const HomePage(label: 'Home', detailsPath: '/$home/$details'),
            );
          },
          routes: [
            GoRoute(
              name: details,
              path: details,
              pageBuilder: (_, state) {
                return NoTransitionPage(
                  key: state.pageKey,
                  child: const DetailsPage(),
                );
              },
            ),
          ],
        ),
        GoRoute(
          name: settings,
          path: '/$settings/:tab(${SettingsTabA.routeName}|${SettingsTabB.routeName})',
          pageBuilder: (_, state) {
            return NoTransitionPage(
              key: state.pageKey,
              child: const SettingsPage(),
            );
          },
        ),
      ],
    ),
  ],
  observers: [
    MyNavObserver(),
  ],
);
