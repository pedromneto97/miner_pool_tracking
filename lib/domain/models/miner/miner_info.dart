import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'address_history.dart';

part 'miner_info.g.dart';

@JsonSerializable(createToJson: false)
class MinerInfo extends Equatable {
  final double average24h;
  final double average7d;
  final double unpaid;
  final double totalPaid;
  final double pending;
  final double customPayout;
  final List<AddressHistory> history;

  const MinerInfo({
    required this.average24h,
    required this.average7d,
    required this.unpaid,
    required this.pending,
    required this.totalPaid,
    required this.customPayout,
    required this.history,
  });

  factory MinerInfo.fromJson(Map<String, dynamic> json) => _$MinerInfoFromJson(json);

  @override
  List<Object?> get props => [
        average24h,
        average7d,
        unpaid,
        totalPaid,
        pending,
        customPayout,
      ];
}
