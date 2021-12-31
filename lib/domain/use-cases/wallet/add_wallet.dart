import 'package:get_it/get_it.dart';

import '../../models/models.dart';
import '../../services/wallet_service.dart';

class AddWalletUseCase {
  const AddWalletUseCase();

  call({
    required String address,
    required CoinSymbol symbol,
    required bool isSolo,
  }) =>
      GetIt.I<WalletService>().addWallet(
        Wallet(
          address: address,
          symbol: symbol,
          isSolo: isSolo,
        ),
      );
}
