import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

@immutable
class ScaffoldWithNavBarTabItem extends BottomNavigationBarItem {
  const ScaffoldWithNavBarTabItem({
    required this.initialLocation,
    required super.icon,
    super.label,
  });

  final String initialLocation;
}

@immutable
class ScaffoldWithBottomNavBar extends StatefulWidget {
  const ScaffoldWithBottomNavBar({
    super.key,
    required this.child,
    required this.tabs,
  });

  final Widget child;
  final List<ScaffoldWithNavBarTabItem> tabs;

  @override
  State<ScaffoldWithBottomNavBar> createState() => _ScaffoldWithBottomNavBarState();
}

class _ScaffoldWithBottomNavBarState extends State<ScaffoldWithBottomNavBar> {
  int _locationToTabIndex(String location) {
    final index = widget.tabs.indexWhere((tab) => location.startsWith(tab.initialLocation));
    // if index not found (-1), return 0
    return (index < 0) ? 0 : index;
  }

  int get _currentIndex => _locationToTabIndex(GoRouter.of(context).location);

  void _onItemTapped(BuildContext context, int tabIndex) {
    // Only navigate if the tab index has changed
    if (tabIndex == _currentIndex) return;

    if (tabIndex == 0) {
      context.go('/home');
    }

    if (tabIndex == 1) {
      context.go('/settings/settings_tab_a');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.child,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        items: widget.tabs,
        onTap: (index) => _onItemTapped(context, index),
      ),
    );
  }
}
