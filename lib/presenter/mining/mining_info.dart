import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../domain/domain.dart';
import 'widgets/mining_info_table.dart';

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
  final notifier = ValueNotifier<MiningData?>(null);
  final consumptionController = TextEditingController(text: '0');

  @override
  void initState() {
    super.initState();
    const MiningInfoUseCase().call(widget.wallet).then(
      (MiningData value) {
        notifier.value = value;
      },
    );
  }

  @override
  void dispose() {
    notifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.wallet.address),
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
              ValueListenableBuilder<MiningData?>(
                valueListenable: notifier,
                builder: (_, miningData, __) {
                  if (miningData == null) {
                    return const CircularProgressIndicator();
                  }
                  final profitSec = miningData.minerInfo.average24h /
                      miningData.poolInfo.networkHash /
                      miningData.poolInfo.blockTime *
                      miningData.poolInfo.minerReward;
                  return Padding(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: ValueListenableBuilder<TextEditingValue>(
                      builder: (_, consumption, __) => MiningInfoTable(
                        profitPerSec: profitSec,
                        miningData: miningData,
                        consumption: consumption.text.isEmpty ? 0 : int.parse(consumption.text),
                      ),
                      valueListenable: consumptionController,
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
