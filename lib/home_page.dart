import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_playground/app_dialog.dart';
import 'package:go_router_playground/service_locator.dart';

@immutable
class HomePage extends StatelessWidget {
  static const name = 'home';

  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GoRouter Playground'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Home', style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 100),
            TextButton(
              child: const Text('Go to Detail'),
              onPressed: () => context.go('/home/details'),
            ),
            const SizedBox(height: 100),
            TextButton(
              child: const Text('Go to Login'),
              onPressed: () {
                context.push('/login');
                if (loginProviderLogic.isLoggedIn) {
                  AppDialog.showSimpleDialog(context, title: 'Already logged in');
                }
              },
            ),
            const SizedBox(height: 100),
            TextButton(
              child: const Text('Login me'),
              onPressed: () {
                loginProviderLogic.isLoggedIn = true;
                AppDialog.showSimpleDialog(context, title: 'User logged in');
              },
            ),
          ],
        ),
      ),
    );
  }
}
