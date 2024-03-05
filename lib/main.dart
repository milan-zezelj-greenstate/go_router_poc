import 'package:flutter/material.dart';
import 'package:go_router_poc/presentation/router/go_router.dart';

void main() {
  runApp(const MainApp());
}

// final _router = GoRouter(routes: [
//   GoRoute(path: '/', builder: (context, state) => const HomeScreen())
// ]);

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
    );
  }
}
