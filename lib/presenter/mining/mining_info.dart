import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
  final consumptionController = TextEditingController(text: '');

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

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
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: consumptionController,
                        decoration: InputDecoration(
                          label: const Text('Consumption'),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          suffixText: 'W',
                          contentPadding: const EdgeInsets.all(16),
                        ),
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                        keyboardType: TextInputType.number,
                      ),
                    ),
                  ],
                ),
                BlocBuilder<MiningInfoBloc, MiningInfoState>(
                  builder: (context, state) {
                    if (state is MiningInfoSuccess) {
                      return Padding(
                        padding: const EdgeInsets.only(top: 16.0),
                        child: ValueListenableBuilder<TextEditingValue>(
                          builder: (_, consumption, __) => MiningInfoDetails(
                            miningData: state.miningData,
                            consumption: consumption.text.isNotEmpty ? int.parse(consumption.text) : 0,
                          ),
                          valueListenable: consumptionController,
                        ),
                      );
                    }
                    return const CircularProgressIndicator();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
