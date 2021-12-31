import '../../domain/domain.dart';

abstract class SettingsDatasource {
  const SettingsDatasource();

  Future<Settings> get settings;

  Future<Settings> saveSettings(Settings settings);
}
