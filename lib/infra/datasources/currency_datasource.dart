import '../../domain/domain.dart';

abstract class CurrencyDatasource {
  const CurrencyDatasource();

  Future<double> getCurrencyInUSD(CoinSymbol symbol);
}
