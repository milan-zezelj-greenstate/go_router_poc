// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'go_router.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $aScreenRoute,
    ];

RouteBase get $aScreenRoute => GoRouteData.$route(
      path: '/a',
      factory: $AScreenRouteExtension._fromState,
      routes: [
        GoRouteData.$route(
          path: 'details',
          factory: $DetailsScreenRouteExtension._fromState,
          routes: [
            GoRouteData.$route(
              path: 'b',
              factory: $BDetailsScreenRouteExtension._fromState,
            ),
          ],
        ),
      ],
    );

extension $AScreenRouteExtension on AScreenRoute {
  static AScreenRoute _fromState(GoRouterState state) => AScreenRoute();

  String get location => GoRouteData.$location(
        '/a',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $DetailsScreenRouteExtension on DetailsScreenRoute {
  static DetailsScreenRoute _fromState(GoRouterState state) =>
      DetailsScreenRoute(
        label: state.uri.queryParameters['label']!,
      );

  String get location => GoRouteData.$location(
        '/a/details',
        queryParams: {
          'label': label,
        },
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $BDetailsScreenRouteExtension on BDetailsScreenRoute {
  static BDetailsScreenRoute _fromState(GoRouterState state) =>
      BDetailsScreenRoute();

  String get location => GoRouteData.$location(
        '/a/details/b',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}
