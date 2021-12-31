import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hive/hive.dart';

import '../../domain/domain.dart';
import '../../infra/infra.dart';

class WalletDatasourceImplementation extends WalletDatasource {
  static const _boxName = 'wallets';
  static const _keyName = 'wallets';

  final FlutterSecureStorage secureStorage = const FlutterSecureStorage();

  late final Box _hiveBox;
  late final Future<Box> awaitForBoxOpen;
  bool _isBoxOpen = false;

  Future<Box> get box async {
    if (_isBoxOpen) {
      return _hiveBox;
    }
    return awaitForBoxOpen;
  }

  WalletDatasourceImplementation() {
    awaitForBoxOpen = secureStorage.read(key: 'key').then(
      (key) {
        final encryptionKey = base64Url.decode(key!);

        return Hive.openBox(
          _boxName,
          encryptionCipher: HiveAesCipher(encryptionKey),
        ).then((openBox) {
          _hiveBox = openBox;
          _isBoxOpen = true;
          return openBox;
        });
      },
    );
  }

  @override
  Future<List<Wallet>> addWallet({required Wallet wallet}) async {
    final wallets = await _getWalletsFromBox();
    wallets.add(wallet);

    await _saveWalletsList(wallets: wallets);

    return wallets;
  }

  @override
  Future<List<Wallet>> getWallets() => _getWalletsFromBox();

  @override
  Future<List<Wallet>> removeWallet({required Wallet wallet}) async {
    final wallets = await _getWalletsFromBox();

    final removed = wallets.remove(wallet);
    if (removed) {
      await _saveWalletsList(wallets: wallets);
    }

    return wallets;
  }

  Future<List<Wallet>> _getWalletsFromBox() async {
    final openBox = await box;
    final wallets = openBox.get(_keyName) as List<dynamic>?;

    return wallets
            ?.map<Wallet>(
              (e) => Wallet.fromJson(
                (e as Map<dynamic, dynamic>).map<String, dynamic>(
                  (key, value) => MapEntry(key, value),
                ),
              ),
            )
            .toList() ??
        <Wallet>[];
  }

  Future<void> _saveWalletsList({required List<Wallet> wallets}) async {
    final openBox = await box;
    openBox.put(_keyName, wallets.map((e) => e.toJson()).toList());
  }
}
