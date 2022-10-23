import 'package:flutter/material.dart';

@immutable
class SettingsTabB extends StatelessWidget {
  static const name = 'settings_tab_b';

  const SettingsTabB({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('Settings Tab B'),
        const SizedBox(height: 20),
        TextButton(
          child: const Text('Foo'),
          onPressed: () {},
        ),
      ],
    );
  }
}
