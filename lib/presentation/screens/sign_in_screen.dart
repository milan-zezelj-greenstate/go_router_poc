import 'package:flutter/material.dart';

class SignInScreen extends StatelessWidget {
  final String label;
  const SignInScreen({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(label),
      ),
    );
  }
}
