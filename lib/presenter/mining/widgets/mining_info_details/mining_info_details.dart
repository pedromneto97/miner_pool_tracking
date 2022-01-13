import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../domain/domain.dart';
import 'widgets/widgets.dart';

class MiningInfoDetails extends StatelessWidget {
  final MiningData miningData;
  final int consumption;

  const MiningInfoDetails({
    Key? key,
    required this.miningData,
    required this.consumption,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final numberFormat = NumberFormat.compact();
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CardInfo(
              title: '24h average',
              subtitle: numberFormat.format(
                miningData.minerInfo.average24h,
              ),
            ),
            CardInfo(
              title: '7d average',
              subtitle: numberFormat.format(
                miningData.minerInfo.average7d,
              ),
            ),
            CardInfo(
              title: 'Network hash',
              subtitle: numberFormat.format(
                miningData.poolInfo.networkHash,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 16,
        ),
        SizedBox(
          height: 240,
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text('Balance'),
                  const SizedBox(height: 16),
                  Text.rich(
                    TextSpan(
                      text: 'Unpaid: ',
                      children: [
                        TextSpan(
                          text: miningData.minerInfo.unpaid.toString(),
                        ),
                      ],
                    ),
                  ),
                  const Divider(),
                  Text.rich(
                    TextSpan(
                      text: 'Pending: ',
                      children: [
                        TextSpan(
                          text: miningData.minerInfo.pending.toString(),
                        ),
                      ],
                    ),
                  ),
                  const Divider(),
                  Text.rich(
                    TextSpan(
                      text: 'Total paid: ',
                      style: Theme.of(context).textTheme.bodyText1,
                      children: [
                        TextSpan(
                          text: miningData.minerInfo.totalPaid.toString(),
                          style: Theme.of(context).textTheme.bodyText2,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        MiningInfoTable(
          miningData: miningData,
          consumption: consumption,
        ),
      ],
    );
  }
}
