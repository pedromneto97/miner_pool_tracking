import 'dart:io';

import 'package:dio/dio.dart';

import '../../domain/domain.dart';
import '../../infra/infra.dart';

class MiningPoolDatasourceImplementation extends MiningPoolDatasource {
  final dio = Dio();

  MiningPoolDatasourceImplementation();

  @override
  Future<MinerInfo> getMinerInfo(Wallet wallet) async {
    final response = await dio.get(
        'https://${wallet.isSolo ? 'solo-' : ''}${wallet.symbol.name}.minerpool.org/api/worker_stats?address=${wallet.address}');
    if (response.statusCode == HttpStatus.ok) {
      final data = response.data as Map<String, dynamic>;

      final miningPoolInfoMap = <String, dynamic>{};

      data.forEach((key, value) {
        switch (key) {
          case 'hashAvg24h':
            miningPoolInfoMap['average24h'] = double.parse(value);
            break;
          case 'hashAvg7d':
            miningPoolInfoMap['average7d'] = double.parse(value);
            break;
          case 'balance':
            miningPoolInfoMap['pending'] = value;
            break;
          case 'immature':
            miningPoolInfoMap['unpaid'] = value;
            break;
          case 'paid':
            miningPoolInfoMap['totalPaid'] = value;
            break;
          case 'customPayout':
            miningPoolInfoMap['customPayout'] = num.parse(value);
            break;
          case 'history':
            miningPoolInfoMap['history'] = (value as List<dynamic>)
                .map<Map<String, dynamic>>(
                  (e) => {
                    'time': e['t'] * 1000,
                    'hashRate': num.parse(e['h']),
                    'hashRate2hAverage': num.parse(e['havg2h']),
                  },
                )
                .toList(growable: false);
        }
      });

      return MinerInfo.fromJson(miningPoolInfoMap);
    }
    throw Exception();
  }

  @override
  Future<PoolInfo> getPoolInfo({required Wallet wallet}) async {
    final response =
        await dio.get('https://${wallet.isSolo ? 'solo-' : ''}${wallet.symbol.name}.minerpool.org/api/stats');
    if (response.statusCode == HttpStatus.ok) {
      final data = response.data as Map<String, dynamic>;
      final poolInfo = <String, dynamic>{};
      data.forEach((key, value) {
        switch (key) {
          case 'blockTime':
            poolInfo['blockTime'] = (value as int).toDouble();
            break;
          case 'minerReward':
            poolInfo['minerReward'] = value;
            break;
          case 'poolStats':
            poolInfo['networkHash'] = double.parse(value['networkSols']);
            break;
          case 'minimumPayment':
            poolInfo['minimumPayment'] = value;
            break;
        }
      });
      return PoolInfo.fromJson(poolInfo);
    }
    throw Exception();
  }
}
