import 'package:flutter/material.dart';

import 'biometry_controller.dart';

class BiometrySwitch extends StatefulWidget {
  const BiometrySwitch({Key? key}) : super(key: key);

  @override
  _BiometrySwitchState createState() => _BiometrySwitchState();
}

class _BiometrySwitchState extends State<BiometrySwitch> {
  final BiometryController biometryController = BiometryController();

  @override
  void dispose() {
    biometryController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: biometryController.settingsNotifier,
      child: const Text('Enable biometry'),
      builder: (_, value, child) {
        return SwitchListTile.adaptive(
          value: value,
          onChanged: biometryController.onChange,
          title: child,
        );
      },
    );
  }
}
