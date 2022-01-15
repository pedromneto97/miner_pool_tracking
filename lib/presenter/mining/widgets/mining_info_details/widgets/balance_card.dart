import 'package:flutter/material.dart';

import '../../../../../domain/domain.dart';
import '../../../../../widgets/widgets.dart';

class BalanceCard extends StatelessWidget {
  final MiningData miningData;

  const BalanceCard({
    Key? key,
    required this.miningData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 160 + 32,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text('Balance'),
              const SizedBox(height: 16),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          LabeledText(
                            label: 'Unpaid: ',
                            text: miningData.minerInfo.unpaid.toString(),
                            tooltipMessage: 'Rewards from blocks found with less\n than 100 confirmations',
                          ),
                          const Divider(),
                          LabeledText(
                            label: 'Pending: ',
                            text: miningData.minerInfo.pending.toString(),
                            tooltipMessage: 'Rewards ready to be paid,\n but below payout threshold',
                          ),
                          const Divider(),
                          LabeledText(
                            label: 'Total paid: ',
                            text: miningData.minerInfo.totalPaid.toString(),
                            tooltipMessage: 'Total paid to this address',
                          ),
                        ],
                      ),
                    ),
                    const VerticalDivider(thickness: 1.5),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          LabeledText(
                            label: 'Min. payout: ',
                            text: miningData.poolInfo.minimumPayment.toString(),
                            tooltipMessage: 'Default pool minimum payout threshold',
                          ),
                          const Divider(),
                          LabeledText(
                            label: 'Custom payout: ',
                            text: miningData.minerInfo.customPayout.toString(),
                          ),
                          const Divider(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
