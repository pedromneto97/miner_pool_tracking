// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'miner_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MinerInfo _$MinerInfoFromJson(Map<String, dynamic> json) => MinerInfo(
      average24h: (json['average24h'] as num).toDouble(),
      average7d: (json['average7d'] as num).toDouble(),
      balance: (json['balance'] as num).toDouble(),
    );

Map<String, dynamic> _$MinerInfoToJson(MinerInfo instance) => <String, dynamic>{
      'average24h': instance.average24h,
      'average7d': instance.average7d,
      'balance': instance.balance,
    };
