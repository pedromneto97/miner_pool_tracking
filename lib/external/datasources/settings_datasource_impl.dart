import 'package:hive/hive.dart';

import '../../domain/domain.dart';
import '../../infra/infra.dart';

class SettingsDatasourceImplementation extends SettingsDatasource {
  static const _boxName = 'settings';
  static const _keyName = 'settings';

  late final Box _hiveBox;
  late final Future<Box> awaitForBoxOpen;
  bool _isBoxOpen = false;

  Future<Box> get box async {
    if (_isBoxOpen) {
      return _hiveBox;
    }
    return awaitForBoxOpen;
  }

  SettingsDatasourceImplementation() {
    awaitForBoxOpen = Hive.openBox(_boxName).then((value) {
      _isBoxOpen = true;
      return _hiveBox = value;
    });
  }

  @override
  Future<Settings> saveSettings(Settings settings) async {
    final openBox = await box;
    openBox.put(_keyName, settings.toJson());
    return settings;
  }

  @override
  Future<Settings> get settings => box.then(
        (openBox) {
          final settingsMap = openBox.get(
            _keyName,
          );
          if (settingsMap == null) {
            return const Settings(energyCost: 0);
          }
          return Settings.fromJson(
            (settingsMap as Map<dynamic, dynamic>).map<String, dynamic>(
              (key, value) => MapEntry(key, value),
            ),
          );
        },
      );
}
