import '../../domain/domain.dart';

abstract class WalletDatasource {
  const WalletDatasource();

  Future<List<Wallet>> addWallet({
    required Wallet wallet,
  });

  Future<List<Wallet>> getWallets();

  Future<List<Wallet>> removeWallet({
    required Wallet wallet,
  });
}
