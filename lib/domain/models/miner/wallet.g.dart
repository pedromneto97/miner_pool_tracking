// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wallet.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Wallet _$WalletFromJson(Map<String, dynamic> json) => Wallet(
      address: json['address'] as String,
      symbol: $enumDecode(_$CoinSymbolEnumMap, json['symbol']),
      isSolo: json['isSolo'] as bool,
      consumption: json['consumption'] as int? ?? 0,
    );

Map<String, dynamic> _$WalletToJson(Wallet instance) => <String, dynamic>{
      'address': instance.address,
      'symbol': _$CoinSymbolEnumMap[instance.symbol],
      'isSolo': instance.isSolo,
      'consumption': instance.consumption,
    };

const _$CoinSymbolEnumMap = {
  CoinSymbol.flux: 'flux',
  CoinSymbol.rvn: 'rvn',
  CoinSymbol.zer: 'zer',
  CoinSymbol.tent: 'tent',
};
