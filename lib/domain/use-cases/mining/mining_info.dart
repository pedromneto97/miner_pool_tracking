import 'package:get_it/get_it.dart';

import '../../models/models.dart';
import '../../repositories/mining_repository.dart';

class MiningInfoUseCase {
  const MiningInfoUseCase();

  Future<MiningData> call(Wallet wallet) => GetIt.I<MiningRepository>().getMiningInfo(wallet);
}
