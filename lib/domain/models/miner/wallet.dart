import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import '../pool/coin.dart';

part 'wallet.g.dart';

@JsonSerializable()
class Wallet extends Equatable {
  final String address;
  final CoinSymbol symbol;
  final bool isSolo;
  final int consumption;

  const Wallet({
    required this.address,
    required this.symbol,
    required this.isSolo,
    this.consumption = 0,
  });

  factory Wallet.fromJson(Map<String, dynamic> json) => _$WalletFromJson(json);

  Map<String, dynamic> toJson() => _$WalletToJson(this);

  @override
  List<Object?> get props => [address, symbol, isSolo, consumption];
}
