import 'package:flutter/foundation.dart';

import '../models/models.dart';

abstract class WalletService {
  final ValueNotifier<List<Wallet>> notifier;

  const WalletService({
    required this.notifier,
  });

  Future<void> addWallet(Wallet wallet);

  Future<void> getWallets();

  Future<void> removeWallet(Wallet wallet);
}
