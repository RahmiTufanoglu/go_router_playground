import 'package:go_router/go_router.dart';
import 'package:go_router_playground/custom_slider.dart';
import 'package:go_router_playground/login_page.dart';
import 'package:go_router_playground/router/router.dart';

GoRoute get loginRoute {
  return GoRoute(
    name: 'login',
    path: '/login',
    parentNavigatorKey: rootNavigatorKey,
    pageBuilder: (_, state) {
      return CustomSlideTransition(
        key: state.pageKey,
        child: const LoginPage(),
      );
    },
  );
}
