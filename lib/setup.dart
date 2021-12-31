import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'domain/domain.dart';
import 'external/external.dart';
import 'infra/infra.dart';
import 'presenter/app/app_router.dart';

Future setup() async {
  await Hive.initFlutter();

  const secureStorage = FlutterSecureStorage();

  final containsEncryptionKey = await secureStorage.read(key: 'key');
  if (containsEncryptionKey == null) {
    final key = Hive.generateSecureKey();

    await secureStorage.write(key: 'key', value: base64Url.encode(key));
  }

  GetIt.I.registerSingleton<AppRouter>(AppRouter());

  final settingsDatasource = SettingsDatasourceImplementation();
  await settingsDatasource.awaitForBoxOpen;

  GetIt.I.registerSingleton<SettingsDatasource>(settingsDatasource);
  GetIt.I.registerSingleton<WalletDatasource>(WalletDatasourceImplementation());
  GetIt.I.registerLazySingleton<MiningPoolDatasource>(() => MiningPoolDatasourceImplementation());
  GetIt.I.registerLazySingleton<CurrencyDatasource>(() => CurrencyDatasourceImplementation());

  GetIt.I.registerLazySingleton<LocalAuthDriver>(() => LocalAuthDriverImplementation());

  GetIt.I.registerSingleton<SettingsService>(SettingsServiceImplementation());
  GetIt.I.registerSingleton<AuthenticationService>(AuthenticationServiceImplementation());
  GetIt.I.registerLazySingleton<WalletService>(() => WalletServiceImplementation());

  GetIt.I.registerLazySingleton<MiningRepository>(() => MiningRepositoryImplementation());
}
