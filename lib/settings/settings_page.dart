import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_playground/settings/settings_tab_a.dart';
import 'package:go_router_playground/settings/settings_tab_b.dart';

@immutable
class SettingsPage extends StatefulWidget {
  static const routeName = 'settings';

  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> with SingleTickerProviderStateMixin {
  final _tabs = const [
    Tab(icon: Text('Tab A')),
    Tab(icon: Text('Tab B')),
  ];

  void _onTap(int index) {
    String getRouteName() {
      return (index == 0) ? SettingsTabA.routeName : SettingsTabB.routeName;
    }

    context.goNamed(
      SettingsPage.routeName,
      params: {'settings_tab': getRouteName()},
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _tabs.length,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('GoRouter Playground'),
          bottom: TabBar(
            onTap: _onTap,
            tabs: _tabs,
          ),
        ),
        body: const TabBarView(
          children: [
            SettingsTabA(),
            SettingsTabB(),
          ],
        ),
      ),
    );
  }
}
