import 'package:go_router/go_router.dart';
import 'package:go_router_playground/custom_slider.dart';
import 'package:go_router_playground/settings/index.dart';

GoRoute get settingsRoute {
  return GoRoute(
    name: 'settings',
    path: '/settings/:settings_tab(settings_tab_a|settings_tab_b)',
    pageBuilder: (_, state) {
      return CustomSlideTransition(
        key: state.pageKey,
        child: const SettingsPage(),
      );
    },
  );
}
