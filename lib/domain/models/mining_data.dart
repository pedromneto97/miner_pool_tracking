import 'package:equatable/equatable.dart';

import 'miner_info.dart';
import 'pool_info.dart';

class MiningData extends Equatable {
  final MinerInfo minerInfo;
  final PoolInfo poolInfo;
  final double cryptoToUSDRate;

  const MiningData({
    required this.cryptoToUSDRate,
    required this.minerInfo,
    required this.poolInfo,
  });

  double get profitPerSec => minerInfo.average24h / poolInfo.estimatedRewardPerSec;

  @override
  List<Object?> get props => [minerInfo, poolInfo];
}
