import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';

import '../../../../domain/domain.dart';

class BiometryController {
  final ValueNotifier<bool> settingsNotifier = ValueNotifier(
    GetIt.I<SettingsService>().settings.enableBiometry,
  );

  void dispose() {
    settingsNotifier.dispose();
  }

  void onChange(bool enabled) async {
    final SettingsService service = GetIt.I<SettingsService>();
    await service.changeBiometrySetting(enabled);
    settingsNotifier.value = service.settings.enableBiometry;
  }
}
