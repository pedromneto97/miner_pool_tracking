import '../domain/domain.dart';

String imageUrlFromCoinSymbol(CoinSymbol symbol) =>
    'https://minerpool.org/images/${symbol.name}.png';
