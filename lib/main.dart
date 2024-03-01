import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_poc/presentation/screens/a_screen.dart';
import 'package:go_router_poc/presentation/screens/b_screen.dart';
import 'package:go_router_poc/presentation/screens/details_screen.dart';
import 'package:go_router_poc/presentation/screens/home_screen.dart';

void main() {
  runApp(const MainApp());
}

// final _router = GoRouter(routes: [
//   GoRoute(path: '/', builder: (context, state) => const HomeScreen())
// ]);

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> _shellNavigatorKey =
    GlobalKey<NavigatorState>();

final GoRouter _router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: '/a/details/b',
  routes: [
    ShellRoute(
      navigatorKey: _shellNavigatorKey,
      builder: (context, state, child) {
        return Scaffold(
            appBar: AppBar(
              title: const Text("App Bar"),
              actions: [
                TextButton(
                    onPressed: () {
                      // context.push('/a/details/b');
                      context.go('/a/details/b');
                    },
                    child: const Text("A")),
                TextButton(
                    onPressed: () {
                      context.go('/b');
                    },
                    child: const Text("B"))
              ],
            ),
            body: child);
      },
      routes: [
        // This screen is displayed on the ShellRoute's Navigator.
        GoRoute(
          path: '/a',
          builder: (context, state) {
            return const AScreen();
          },
          routes: <RouteBase>[
            // This screen is displayed on the ShellRoute's Navigator.
            GoRoute(
                path: 'details',
                builder: (BuildContext context, GoRouterState state) {
                  return const DetailsScreen(label: 'A');
                },
                routes: [
                  GoRoute(
                    path: 'b',
                    builder: (BuildContext context, GoRouterState state) {
                      return const BScreen();
                    },
                  ),
                ]),
          ],
        ),
        // Displayed ShellRoute's Navigator.
        GoRoute(
          path: '/b',
          builder: (BuildContext context, GoRouterState state) {
            return const BScreen();
          },
          routes: <RouteBase>[
            // Displayed on the root Navigator by specifying the
            // [parentNavigatorKey].
            GoRoute(
              path: 'details',
              parentNavigatorKey: _rootNavigatorKey,
              builder: (BuildContext context, GoRouterState state) {
                return const DetailsScreen(label: 'B');
              },
            ),
          ],
        ),
      ],
    ),
  ],
);

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
    );
  }
}
