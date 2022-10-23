import 'package:go_router/go_router.dart';
import 'package:go_router_playground/custom_slider.dart';
import 'package:go_router_playground/details_page.dart';
import 'package:go_router_playground/home_page.dart';

GoRoute get homeRoute {
  return GoRoute(
    name: 'home',
    path: '/home',
    pageBuilder: (_, state) {
      return CustomSlideTransition(
        key: state.pageKey,
        child: const HomePage(),
      );
    },
    routes: [
      GoRoute(
        name: 'details',
        path: 'details',
        pageBuilder: (_, state) {
          return CustomSlideTransition(
            key: state.pageKey,
            child: const DetailsPage(),
          );
        },
      ),
    ],
  );
}
