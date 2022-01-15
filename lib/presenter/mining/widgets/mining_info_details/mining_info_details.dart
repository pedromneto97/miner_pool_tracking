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
        BalanceCard(
          miningData: miningData,
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
