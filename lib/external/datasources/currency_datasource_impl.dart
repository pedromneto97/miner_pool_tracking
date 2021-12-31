import 'dart:io';

import 'package:dio/dio.dart';

import '../../domain/domain.dart';
import '../../infra/infra.dart';

class CurrencyDatasourceImplementation extends CurrencyDatasource {
  final dio = Dio(
    BaseOptions(
      baseUrl: 'https://api.minerstat.com/v2',
    ),
  );

  CurrencyDatasourceImplementation();

  @override
  Future<double> getCurrencyInUSD(CoinSymbol symbol) async {
    final response = await dio.get(
      '/coins',
      queryParameters: {
        'list': symbol.name,
      },
    );
    if (response.statusCode == HttpStatus.ok) {
      final data = response.data as List<dynamic>;
      return data.first['price'];
    }
    throw Exception();
  }
}
