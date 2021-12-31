// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pool_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PoolInfo _$PoolInfoFromJson(Map<String, dynamic> json) => PoolInfo(
      minerReward: (json['minerReward'] as num).toDouble(),
      blockTime: (json['blockTime'] as num).toDouble(),
      networkHash: (json['networkHash'] as num).toDouble(),
    );

Map<String, dynamic> _$PoolInfoToJson(PoolInfo instance) => <String, dynamic>{
      'minerReward': instance.minerReward,
      'blockTime': instance.blockTime,
      'networkHash': instance.networkHash,
    };
