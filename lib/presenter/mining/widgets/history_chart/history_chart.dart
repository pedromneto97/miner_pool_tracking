import 'package:charts_flutter/flutter.dart';
import 'package:flutter/material.dart';

import '../../../../domain/domain.dart';

class HistoryChart extends StatelessWidget {
  final List<AddressHistory> historyList;

  const HistoryChart({
    Key? key,
    required this.historyList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TimeSeriesChart(
      series,
      animate: true,
      defaultRenderer: LineRendererConfig(
        includePoints: true,
      ),
    );
  }

  DateTime domainFunction(AddressHistory addressHistory, _) => addressHistory.time;

  double hashFunction(AddressHistory addressHistory, _) => addressHistory.hashRate;

  double hash2hAverageFunction(AddressHistory addressHistory, _) => addressHistory.hashRate2hAverage;

  List<Series<AddressHistory, DateTime>> get series {
    final DateTime twoHoursBefore = DateTime.now().subtract(const Duration(hours: 2));
    final filteredHistoryList = historyList
        .where(
          (element) => element.time.isAfter(twoHoursBefore),
        )
        .toList(growable: false);
    return <Series<AddressHistory, DateTime>>[
      Series<AddressHistory, DateTime>(
        id: 'Hash rate',
        data: filteredHistoryList,
        domainFn: domainFunction,
        measureFn: hashFunction,
        colorFn: (_, __) => MaterialPalette.cyan.shadeDefault,
      ),
      Series<AddressHistory, DateTime>(
        id: '2h rate avg',
        data: filteredHistoryList,
        domainFn: domainFunction,
        measureFn: hash2hAverageFunction,
        colorFn: (_, __) => MaterialPalette.blue.shadeDefault,
      ),
    ];
  }
}
