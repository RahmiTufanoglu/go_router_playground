import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_playground/settings/settings_tab_a.dart';
import 'package:go_router_playground/settings/settings_tab_b.dart';

@immutable
class SettingsPage extends StatefulWidget {
  static const name = 'settings';

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
    String selectedTab = (index == 0) ? 'settings_tab_a' : 'settings_tab_b';
    context.go('/settings/$selectedTab');
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
