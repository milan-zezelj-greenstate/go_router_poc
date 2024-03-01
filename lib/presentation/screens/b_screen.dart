import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BScreen extends StatefulWidget {
  const BScreen({super.key});

  @override
  State<BScreen> createState() => _BScreenState();
}

class _BScreenState extends State<BScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text('Screen B'),
            ElevatedButton(
              onPressed: () {
                context.push('/b');
                context.push('/b/details');
              },
              child: Text("Next Screen"),
            ),
            ElevatedButton(
              onPressed: () {
                context.pop();
              },
              child: Text("Go back"),
            ),
          ],
        ),
      ),
    );
  }
}
