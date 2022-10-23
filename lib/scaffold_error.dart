import 'package:flutter/material.dart';

@immutable
class ScaffoldError extends StatelessWidget {
  const ScaffoldError({
    super.key,
    required this.message,
  });

  final String message;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(message),
      ),
    );
  }
}
