import 'package:flutter/widgets.dart';

@immutable
class SettingsTabA extends StatelessWidget {
  static const routeName = 'settings_tab_a';

  const SettingsTabA({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Settings Tab A'),
    );
  }
}
