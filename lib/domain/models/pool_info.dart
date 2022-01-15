import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'pool_info.g.dart';

@JsonSerializable()
class PoolInfo extends Equatable {
  final double minerReward;
  final double blockTime;
  final double networkHash;
  final double minimumPayment;

  const PoolInfo({
    required this.minerReward,
    required this.blockTime,
    required this.networkHash,
    required this.minimumPayment,
  });

  factory PoolInfo.fromJson(Map<String, dynamic> json) => _$PoolInfoFromJson(json);

  Map<String, dynamic> toJson() => _$PoolInfoToJson(this);

  double get estimatedRewardPerSecondPerSol => minerReward / (networkHash * blockTime);

  @override
  List<Object?> get props => [
        minerReward,
        blockTime,
        networkHash,
        minimumPayment,
      ];
}
