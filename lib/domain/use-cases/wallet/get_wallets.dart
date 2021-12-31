import 'package:get_it/get_it.dart';

import '../../services/services.dart';

class GetWalletsUseCase {
  const GetWalletsUseCase();

  call() => GetIt.I<WalletService>().getWallets();
}
