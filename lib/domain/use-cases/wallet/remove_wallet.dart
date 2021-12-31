import 'package:get_it/get_it.dart';

import '../../models/models.dart';
import '../../services/wallet_service.dart';

class RemoveWalletUseCase {
  const RemoveWalletUseCase();

  call(Wallet wallet) async {
    await GetIt.I<WalletService>().removeWallet(wallet);
  }
}
