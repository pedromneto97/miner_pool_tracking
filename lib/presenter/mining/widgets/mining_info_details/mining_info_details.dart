import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mining_profit/widgets/touchable_opacity.dart';
import 'package:url_launcher/url_launcher.dart';

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

  void onTapMinerstat() async {
    const url = 'https://minerstat.com/';
    final canLaunchUrl = await canLaunch(url);
    if (canLaunchUrl) {
      await launch(url);
    }
  }

  @override
  Widget build(BuildContext context) {
    final numberFormat = NumberFormat.compact();
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
        const SizedBox(
          height: 16,
        ),
        SafeArea(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Provided by '),
              TouchableOpacity(
                onTap: onTapMinerstat,
                child: const Text(
                  'minerstat',
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
