import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../../../../domain/domain.dart';
import '../../../../../utils/string_extension.dart';
import '../../../bloc/mining_info_bloc.dart';

class MiningInfoTable extends StatelessWidget {
  final MiningData miningData;
  final int consumption;

  const MiningInfoTable({
    Key? key,
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
        TableRow(
          children: [
            const TableCell(
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Period',
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            TableCell(
              child: Padding(
                padding: const EdgeInsets.all(4),
                child: BlocSelector<MiningInfoBloc, MiningInfoState, String>(
                  selector: (state) {
                    return (state as MiningInfoSuccess).wallet.symbol.name;
                  },
                  builder: (context, state) {
                    return Text(
                      'Est. Reward (${state.capitalize()})',
                      textAlign: TextAlign.center,
                    );
                  },
                ),
              ),
            ),
            const TableCell(
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Receipt (USD)',
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            const TableCell(
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Costs (USD)',
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            const TableCell(
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Profit (USD)',
                  textAlign: TextAlign.center,
                ),
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
    final totalReward = miningData.estimatedRewardPerSec * time;
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
