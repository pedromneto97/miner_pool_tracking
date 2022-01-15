// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address_history.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddressHistory _$AddressHistoryFromJson(Map<String, dynamic> json) =>
    AddressHistory(
      time: const DateTimeEpochConverter().fromJson(json['time'] as int),
      hashRate: json['hashRate'] as String,
      hashRate2hAverage: json['hashRate2hAverage'] as String,
    );
