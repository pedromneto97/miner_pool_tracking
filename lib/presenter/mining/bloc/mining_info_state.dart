part of 'mining_info_bloc.dart';

abstract class MiningInfoState extends Equatable {
  const MiningInfoState();
}

class MiningInfoInitial extends MiningInfoState {
  const MiningInfoInitial();

  @override
  List<Object> get props => [];
}

class MiningInfoLoading extends MiningInfoState {
  const MiningInfoLoading();

  @override
  List<Object> get props => [];
}

class MiningInfoSuccess extends MiningInfoState {
  final MiningData miningData;
  final Wallet wallet;

  const MiningInfoSuccess({
    required this.miningData,
    required this.wallet,
  });

  @override
  List<Object> get props => [miningData, wallet];
}

class MiningInfoFailure extends MiningInfoState {
  const MiningInfoFailure();

  @override
  List<Object> get props => [];
}
