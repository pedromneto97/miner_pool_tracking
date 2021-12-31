import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../domain/domain.dart';
import '../home/home_page.dart';
import '../mining/mining_info.dart';
import '../settings/settings_page.dart';
import '../splash/splash_page.dart';
import 'guards/authentication_guard.dart';

part 'app_router.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  preferRelativeImports: true,
  routes: <AutoRoute>[
    AutoRoute(
      path: '/splash',
      page: SplashPage,
      initial: true,
    ),
    AutoRoute(
      path: '/home',
      guards: [AuthenticationGuard],
      page: HomePage,
    ),
    AutoRoute(
      path: '/mining_info',
      guards: [AuthenticationGuard],
      page: MiningInfoPage,
    ),
    AutoRoute(
      page: SettingsPage,
      guards: [AuthenticationGuard],
      path: '/settings',
    ),
  ],
)
// extend the generated private router
class AppRouter extends _$AppRouter {
  AppRouter()
      : super(
          authenticationGuard: AuthenticationGuard(),
        );
}
