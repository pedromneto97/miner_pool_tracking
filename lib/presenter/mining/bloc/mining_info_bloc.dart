import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/domain.dart';

part 'mining_info_event.dart';
part 'mining_info_state.dart';

class MiningInfoBloc extends Bloc<MiningInfoEvent, MiningInfoState> {
  final MiningInfoUseCase miningInfoUseCase = const MiningInfoUseCase();

  MiningInfoBloc() : super(const MiningInfoInitial()) {
    on<MiningInfoEvent>((event, emit) async {
      if (event is GetMiningDataEvent) {
        emit(const MiningInfoLoading());
        final miningData = await miningInfoUseCase.call(event.wallet);
        emit(
          MiningInfoSuccess(miningData: miningData, wallet: event.wallet),
        );
      }
    });
  }
}
