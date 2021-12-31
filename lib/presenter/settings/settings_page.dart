import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../domain/domain.dart';
import 'widgets/widgets.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            FutureBuilder<bool>(
              future: GetIt.I<SettingsService>().canUseBiometrics,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done && (snapshot.data ?? false)) {
                  return const BiometrySwitch();
                }
                return const SizedBox.shrink();
              },
            ),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: EnergyCost(),
            )
          ],
        ),
      ),
    );
  }
}
