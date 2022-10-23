import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_playground/service_locator.dart';

@immutable
class LoginPage extends StatelessWidget {
  static const name = 'login';

  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          //onPressed: () => context.goNamed(HomePage.routeName),
          onPressed: () => context.pop(),
        ),
      ),
      body: Center(
        child: TextButton(
          child: const Text('Login'),
          onPressed: () {
            loginProviderLogic.isLoggedIn = true;
            context.push('/home');
          },
        ),
      ),
    );
  }
}
