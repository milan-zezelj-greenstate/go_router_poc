import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  final String label;
  const DetailsScreen({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(label),
      ),
    );
  }
}
