import 'package:get_it/get_it.dart';

import '../../domain/domain.dart';
import '../datasources/datasources.dart';

class MiningRepositoryImplementation extends MiningRepository {
  @override
  Future<MiningData> getMiningInfo(Wallet wallet) async {
    final datasource = GetIt.I<MiningPoolDatasource>();

    final miningData = await Future.wait(
      [
        datasource.getMinerInfo(wallet),
        datasource.getPoolInfo(wallet: wallet),
        GetIt.I<CurrencyDatasource>().getCurrencyInUSD(wallet.symbol),
      ],
    ).then(
      (value) => MiningData(
        minerInfo: value.first as MinerInfo,
        poolInfo: value[1] as PoolInfo,
        cryptoToUSDRate: value.last as double,
      ),
    );

    return miningData;
  }
}
