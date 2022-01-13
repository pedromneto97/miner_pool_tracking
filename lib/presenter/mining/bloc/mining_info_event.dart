part of 'mining_info_bloc.dart';

abstract class MiningInfoEvent extends Equatable {
  const MiningInfoEvent();
}

class GetMiningDataEvent extends MiningInfoEvent {
  final Wallet wallet;

  const GetMiningDataEvent({required this.wallet});

  @override
  List<Object?> get props => [wallet];
}
