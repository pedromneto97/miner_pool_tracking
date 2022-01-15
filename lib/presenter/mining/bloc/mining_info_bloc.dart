import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:get_it/get_it.dart';

import '../../../domain/domain.dart';

part 'mining_info_event.dart';
part 'mining_info_state.dart';

class MiningInfoBloc extends Bloc<MiningInfoEvent, MiningInfoState> {
  MiningInfoBloc() : super(const MiningInfoInitial()) {
    on<MiningInfoEvent>((event, emit) async {
      if (event is GetMiningDataEvent) {
        emit(const MiningInfoLoading());
        final miningData = await GetIt.I.get<MiningInfoUseCase>().call(event.wallet);
        emit(
          MiningInfoSuccess(miningData: miningData, wallet: event.wallet),
        );
      }
    });
  }
}
