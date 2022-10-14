import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_playground/details_page.dart';

@immutable
class HomePage extends StatelessWidget {
  static const routeName = 'home';

  const HomePage({
    super.key,
    required this.label,
    required this.detailsPath,
  });

  final String label;
  final String detailsPath;

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
            const Padding(padding: EdgeInsets.all(4)),
            TextButton(
              child: const Text('Go to Detail'),
              onPressed: () => context.goNamed(DetailsPage.routeName),
            ),
          ],
        ),
      ),
    );
  }
}
