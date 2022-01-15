import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../utils/datetime_converter.dart';

part 'address_history.g.dart';

@JsonSerializable(createToJson: false)
@DateTimeEpochConverter()
class AddressHistory extends Equatable {
  final DateTime time;
  final String hashRate;
  final String hashRate2hAverage;

  const AddressHistory({
    required this.time,
    required this.hashRate,
    required this.hashRate2hAverage,
  });

  factory AddressHistory.fromJson(Map<String, dynamic> json) => _$AddressHistoryFromJson(json);

  @override
  List<Object?> get props => [time, hashRate, hashRate2hAverage];
}
