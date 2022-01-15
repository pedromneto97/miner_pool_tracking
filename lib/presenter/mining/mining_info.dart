import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../utils/string_extension.dart';
import '../../domain/domain.dart';
import '../../utils/image_utils.dart';
import 'bloc/mining_info_bloc.dart';
import 'widgets/mining_info_details/mining_info_details.dart';

class MiningInfoPage extends StatefulWidget {
  final Wallet wallet;

  const MiningInfoPage({
    Key? key,
    required this.wallet,
  }) : super(key: key);

  @override
  State<MiningInfoPage> createState() => _MiningInfoPageState();
}

class _MiningInfoPageState extends State<MiningInfoPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      lazy: false,
      create: (context) => MiningInfoBloc()
        ..add(
          GetMiningDataEvent(
            wallet: widget.wallet,
          ),
        ),
      child: Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              Image.network(
                imageUrlFromCoinSymbol(widget.wallet.symbol),
                width: 24,
                height: 24,
              ),
              const SizedBox(width: 16),
              Text(
                '${widget.wallet.symbol.name.capitalize()} wallet',
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          clipBehavior: Clip.antiAlias,
          primary: true,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: BlocBuilder<MiningInfoBloc, MiningInfoState>(
              builder: (context, state) {
                if (state is MiningInfoSuccess) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: MiningInfoDetails(
                      miningData: state.miningData,
                      consumption: widget.wallet.consumption,
                    ),
                  );
                }
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
