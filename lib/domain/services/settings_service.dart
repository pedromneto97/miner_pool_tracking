import '../models/models.dart';

abstract class SettingsService {
  const SettingsService();

  Future<void> changeBiometrySetting(bool enable);

  Future<void> changeEnergyCost(double cost);

  Future<bool> get canUseBiometrics;

  Settings get settings;
}
