import 'dart:async';

import 'package:get_it/get_it.dart';

import '../../domain/domain.dart';
import '../datasources/datasources.dart';
import '../drivers/drivers.dart';

class SettingsServiceImplementation extends SettingsService {
  late Settings _settings;
  final SettingsDatasource _settingsDatasource = GetIt.I<SettingsDatasource>();

  SettingsServiceImplementation() {
    _settingsDatasource.settings.then((settings) => _settings = settings);
  }

  @override
  Future<void> changeBiometrySetting(bool enable) async {
    late Settings newSettings;
    if (enable) {
      final isAuthenticated = await GetIt.I<LocalAuthDriver>().authenticate();

      newSettings = _settings.copyWith(enableBiometry: isAuthenticated);
    } else {
      newSettings = _settings.copyWith(enableBiometry: false);
    }
    _settings = await saveSettings(newSettings);
  }

  @override
  Future<Settings> changeEnergyCost(double cost) async {
    final Settings newSettings = _settings.copyWith(energyCost: cost);
    _settings = await saveSettings(newSettings);
    return _settings;
  }

  @override
  Settings get settings => _settings;

  @override
  Future<bool> get canUseBiometrics => GetIt.I<LocalAuthDriver>().canUseBiometrics;

  Future<Settings> saveSettings(Settings newSettings) async => _settingsDatasource.saveSettings(newSettings);
}
