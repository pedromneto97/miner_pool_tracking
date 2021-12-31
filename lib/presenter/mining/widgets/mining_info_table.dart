import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../../domain/domain.dart';

class MiningInfoTable extends StatelessWidget {
  final double profitPerSec;
  final MiningData miningData;
  final int consumption;

  const MiningInfoTable({
    Key? key,
    required this.profitPerSec,
    required this.miningData,
    required this.consumption,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Table(
      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
      border: TableBorder.all(
        color: Colors.grey[800]!,
        borderRadius: BorderRadius.circular(4),
      ),
      children: [
        const TableRow(
          children: [
            TableCell(
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Period',
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            TableCell(
              child: Text(
                'Reward',
                textAlign: TextAlign.center,
              ),
            ),
            TableCell(
              child: Text(
                'Receipt',
                textAlign: TextAlign.center,
              ),
            ),
            TableCell(
              child: Text(
                'Costs',
                textAlign: TextAlign.center,
              ),
            ),
            TableCell(
              child: Text(
                'Profit',
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
        _getRowForData(time: Duration.secondsPerDay.toDouble(), timeString: '24 hours'),
        _getRowForData(time: (Duration.secondsPerDay * 7).toDouble(), timeString: '7 days'),
        _getRowForData(time: (Duration.secondsPerDay * 30).toDouble(), timeString: '30 days'),
      ],
    );
  }

  TableRow _getRowForData({required double time, required String timeString}) {
    final totalReward = profitPerSec * time;
    final receipt = totalReward * miningData.cryptoToUSDRate;
    final energyCost = GetIt.I<SettingsService>().settings.energyCost;
    final costs = consumption / 1000 * (time / 3600) * energyCost;

    return TableRow(
      children: [
        TableCell(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              timeString,
              textAlign: TextAlign.center,
            ),
          ),
        ),
        TableCell(
          child: Text(
            totalReward.toStringAsFixed(2),
            textAlign: TextAlign.center,
          ),
        ),
        TableCell(
          child: Text(
            receipt.toStringAsFixed(2),
            textAlign: TextAlign.center,
          ),
        ),
        TableCell(
          child: Text(
            costs.toStringAsFixed(2),
            textAlign: TextAlign.center,
          ),
        ),
        TableCell(
          child: Text(
            (receipt - costs).toStringAsFixed(2),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
