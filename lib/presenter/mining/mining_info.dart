import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../utils/string_extension.dart';
import '../../domain/domain.dart';
import '../../utils/image_utils.dart';
import 'bloc/mining_info_bloc.dart';
import 'widgets/widgets.dart';

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
      create: (context) {
        final bloc = MiningInfoBloc();
        WidgetsBinding.instance!.addPostFrameCallback(
          (_) => bloc.add(
            GetMiningDataEvent(
              wallet: widget.wallet,
            ),
          ),
        );
        return bloc;
      },
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: Row(
              children: [
                Hero(
                  tag: 'coin_image_${widget.wallet.address}',
                  child: Image.network(
                    imageUrlFromCoinSymbol(widget.wallet.symbol),
                    width: 24,
                    height: 24,
                  ),
                ),
                const SizedBox(width: 16),
                Hero(
                  tag: 'wallet_type_${widget.wallet.address}',
                  child: Text(
                    '${widget.wallet.symbol.name.capitalize()} wallet',
                    style: Theme.of(context).textTheme.headline5,
                  ),
                ),
              ],
            ),
            bottom: const TabBar(
              tabs: [
                Tab(
                  icon: Icon(
                    Icons.attach_money_rounded,
                  ),
                ),
                Tab(
                  icon: Icon(
                    Icons.show_chart_rounded,
                  ),
                ),
              ],
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: BlocBuilder<MiningInfoBloc, MiningInfoState>(
              builder: (context, state) {
                if (state is MiningInfoSuccess) {
                  return TabBarView(
                    children: [
                      MiningInfoDetails(
                        miningData: state.miningData,
                        consumption: widget.wallet.consumption,
                      ),
                      HistoryChart(
                        historyList: state.miningData.minerInfo.history,
                      ),
                    ],
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
