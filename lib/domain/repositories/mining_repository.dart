import '../models/models.dart';

abstract class MiningRepository {
  const MiningRepository();

  Future<MiningData> getMiningInfo(Wallet wallet);
}
