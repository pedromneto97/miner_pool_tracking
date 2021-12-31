import 'package:auto_route/auto_route.dart';
import 'package:get_it/get_it.dart';

import '../../../domain/services/authentication_service.dart';
import '../app_router.dart';

class AuthenticationGuard extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    final isAuthenticated = GetIt.I<AuthenticationService>().isAuthenticated;
    if (isAuthenticated) {
      resolver.next(true);
    } else {
      router.pushAndPopUntil(const SplashRoute(), predicate: (route) => route.isFirst);
    }
  }
}
