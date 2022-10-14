import 'package:flutter/widgets.dart';

@immutable
class SettingsTabB extends StatelessWidget {
  static const routeName = 'settings_tab_b';

  const SettingsTabB({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Settings Tab B'),
    );
  }
}
