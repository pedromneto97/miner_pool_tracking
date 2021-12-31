import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import 'app_router.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final appRoute = GetIt.I<AppRouter>();

    return MaterialApp.router(
      title: 'Mining info',
      theme: ThemeData.from(
        colorScheme: const ColorScheme.dark(),
      ),
      routeInformationParser: appRoute.defaultRouteParser(),
      routerDelegate: appRoute.delegate(),
    );
  }
}
