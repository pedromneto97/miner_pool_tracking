import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../domain/domain.dart';
import '../datasources/datasources.dart';

class WalletServiceImplementation extends WalletService {
  WalletServiceImplementation()
      : super(
          notifier: ValueNotifier<List<Wallet>>([]),
        );

  @override
  Future<void> addWallet(Wallet wallet) async {
    if (notifier.value.contains(wallet)) {
      return;
    }

    final wallets = await GetIt.I<WalletDatasource>().addWallet(
      wallet: wallet,
    );

    notifier.value = wallets;
  }

  @override
  Future<void> getWallets() async {
    final wallets = await GetIt.I<WalletDatasource>().getWallets();

    notifier.value = wallets;
  }

  @override
  Future<void> removeWallet(Wallet wallet) async {
    final wallets = await GetIt.I<WalletDatasource>().removeWallet(wallet: wallet);

    notifier.value = wallets;
  }
}
