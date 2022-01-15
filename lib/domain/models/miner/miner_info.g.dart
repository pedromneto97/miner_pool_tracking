// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'miner_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MinerInfo _$MinerInfoFromJson(Map<String, dynamic> json) => MinerInfo(
      average24h: (json['average24h'] as num).toDouble(),
      average7d: (json['average7d'] as num).toDouble(),
      unpaid: (json['unpaid'] as num).toDouble(),
      pending: (json['pending'] as num).toDouble(),
      totalPaid: (json['totalPaid'] as num).toDouble(),
      customPayout: (json['customPayout'] as num).toDouble(),
      history: (json['history'] as List<dynamic>)
          .map((e) => AddressHistory.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
