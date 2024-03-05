import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_poc/presentation/screens/a_screen.dart';
import 'package:go_router_poc/presentation/screens/b_screen.dart';
import 'package:go_router_poc/presentation/screens/details_screen.dart';
import 'package:go_router_poc/presentation/screens/sign_in_screen.dart';

part 'go_router.g.dart';

final isSignedIn = true;

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> _shellNavigatorKey =
    GlobalKey<NavigatorState>();

@TypedGoRoute<AScreenRoute>(
  path: '/a',
  routes: [
    // This screen is displayed on the ShellRoute's Navigator.
    TypedGoRoute<DetailsScreenRoute>(
      path: 'details',
      routes: [
        TypedGoRoute<BDetailsScreenRoute>(
          path: 'b',
        ),
      ],
    ),
  ],
)
class AScreenRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const AScreen();
  }
}

@immutable
class DetailsScreenRoute extends GoRouteData {
  final String label;

  const DetailsScreenRoute({
    required this.label,
  });

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return DetailsScreen(label: label);
  }
}

class BDetailsScreenRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const BScreen();
  }
}

final GoRouter router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: '/a',
  redirect: (context, state) {
    if (!isSignedIn) {
      return "/login";
    } else {
      return null;
    }
  },
  routes: [
    ShellRoute(
      builder: (context, state, child) {
        return Scaffold(body: child);
      },
      routes: [
        GoRoute(
          path: "/login",
          builder: (context, state) => SignInScreen(label: "Sign in"),
        ),
      ],
    ),
    ShellRoute(
      navigatorKey: _shellNavigatorKey,
      builder: (context, state, child) {
        return Scaffold(
            appBar: AppBar(
              title: const Text("App Bar"),
              actions: [
                TextButton(
                    onPressed: () {
                      BDetailsScreenRoute().go(context);
                    },
                    child: const Text("Go")),
                TextButton(
                    onPressed: () {
                      context.push('/a/details/b');
                    },
                    child: const Text("Push"))
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
                path: '/details',
                builder: (BuildContext context, GoRouterState state) {
                  return const DetailsScreen(label: 'A');
                },
                routes: [
                  GoRoute(
                    path: '/b',
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
              path: '/details',
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
