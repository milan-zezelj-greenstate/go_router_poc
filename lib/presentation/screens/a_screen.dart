import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AScreen extends StatefulWidget {
  const AScreen({super.key});

  @override
  State<AScreen> createState() => _AScreenState();
}

class _AScreenState extends State<AScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ovo je novi app bar"),
      ),
      body: Center(
        child: Column(
          children: [
            Text('Screen A'),
            ElevatedButton(
                onPressed: () {
                  context.push('/a');
                },
                child: Text("Next Screen")),
          ],
        ),
      ),
    );
  }
}
