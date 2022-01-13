import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'miner_info.g.dart';

@JsonSerializable()
class MinerInfo extends Equatable {
  final double average24h;
  final double average7d;
  final double unpaid;
  final double totalPaid;
  final double pending;

  const MinerInfo({
    required this.average24h,
    required this.average7d,
    required this.unpaid,
    required this.pending,
    required this.totalPaid,
  });

  factory MinerInfo.fromJson(Map<String, dynamic> json) => _$MinerInfoFromJson(json);

  Map<String, dynamic> toJson() => _$MinerInfoToJson(this);

  @override
  List<Object?> get props => [average24h, average7d, unpaid];
}
