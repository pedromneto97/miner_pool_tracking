import '../../domain/domain.dart';

abstract class MiningPoolDatasource {
  const MiningPoolDatasource();

  Future<MinerInfo> getMinerInfo(Wallet wallet);

  Future<PoolInfo> getPoolInfo({required Wallet wallet});
}
