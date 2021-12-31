// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

part of 'app_router.dart';

class _$AppRouter extends RootStackRouter {
  _$AppRouter(
      {GlobalKey<NavigatorState>? navigatorKey,
      required this.authenticationGuard})
      : super(navigatorKey);

  final AuthenticationGuard authenticationGuard;

  @override
  final Map<String, PageFactory> pagesMap = {
    SplashRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const SplashPage());
    },
    HomeRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const HomePage());
    },
    MiningInfoRoute.name: (routeData) {
      final args = routeData.argsAs<MiningInfoRouteArgs>();
      return MaterialPageX<dynamic>(
          routeData: routeData,
          child: MiningInfoPage(key: args.key, wallet: args.wallet));
    },
    SettingsRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const SettingsPage());
    }
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig('/#redirect',
            path: '/', redirectTo: '/splash', fullMatch: true),
        RouteConfig(SplashRoute.name, path: '/splash'),
        RouteConfig(HomeRoute.name,
            path: '/home', guards: [authenticationGuard]),
        RouteConfig(MiningInfoRoute.name,
            path: '/mining_info', guards: [authenticationGuard]),
        RouteConfig(SettingsRoute.name,
            path: '/settings', guards: [authenticationGuard])
      ];
}

/// generated route for
/// [SplashPage]
class SplashRoute extends PageRouteInfo<void> {
  const SplashRoute() : super(SplashRoute.name, path: '/splash');

  static const String name = 'SplashRoute';
}

/// generated route for
/// [HomePage]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute() : super(HomeRoute.name, path: '/home');

  static const String name = 'HomeRoute';
}

/// generated route for
/// [MiningInfoPage]
class MiningInfoRoute extends PageRouteInfo<MiningInfoRouteArgs> {
  MiningInfoRoute({Key? key, required Wallet wallet})
      : super(MiningInfoRoute.name,
            path: '/mining_info',
            args: MiningInfoRouteArgs(key: key, wallet: wallet));

  static const String name = 'MiningInfoRoute';
}

class MiningInfoRouteArgs {
  const MiningInfoRouteArgs({this.key, required this.wallet});

  final Key? key;

  final Wallet wallet;

  @override
  String toString() {
    return 'MiningInfoRouteArgs{key: $key, wallet: $wallet}';
  }
}

/// generated route for
/// [SettingsPage]
class SettingsRoute extends PageRouteInfo<void> {
  const SettingsRoute() : super(SettingsRoute.name, path: '/settings');

  static const String name = 'SettingsRoute';
}
