import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../domain/domain.dart';
import '../app/app_router.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  Future<bool> authenticationFuture = GetIt.I<AuthenticationService>().authenticate();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: authenticationFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.data!) {
            AutoRouter.of(context).replace(const HomeRoute());
          } else {
            return const Scaffold(
              body: Center(
                child: Text('Cannot authenticate'),
              ),
            );
          }
        }
        return const Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}
