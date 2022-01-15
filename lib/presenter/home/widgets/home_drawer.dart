import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../app/app_router.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          ListTile(
            title: const Text('Settings'),
            onTap: () {
              context.router.pop();
              context.router.push(
                const SettingsRoute(),
              );
            },
          )
        ],
      ),
    );
  }
}
