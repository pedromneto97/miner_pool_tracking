import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'miner_info.g.dart';

@JsonSerializable()
class MinerInfo extends Equatable {
  final double average24h;
  final double average7d;
  final double balance;

  const MinerInfo({
    required this.average24h,
    required this.average7d,
    required this.balance,
  });

  factory MinerInfo.fromJson(Map<String, dynamic> json) => _$MinerInfoFromJson(json);

  Map<String, dynamic> toJson() => _$MinerInfoToJson(this);

  @override
  List<Object?> get props => [average24h, average7d, balance];
}
