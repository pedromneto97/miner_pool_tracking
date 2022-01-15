import 'package:flutter/material.dart';

import '../../../../../domain/domain.dart';
import '../../../../../utils/image_utils.dart';

class CoinSymbolDropdown extends StatelessWidget {
  final ValueNotifier<CoinSymbol> controller;

  const CoinSymbolDropdown({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<CoinSymbol>(
      valueListenable: controller,
      builder: (context, value, child) {
        return DropdownButton<CoinSymbol>(
          alignment: Alignment.center,
          iconSize: 16,
          items: items,
          onChanged: onChanged,
          value: value,
        );
      },
    );
  }

  void onChanged(CoinSymbol? newValue) => controller.value = newValue!;

  List<DropdownMenuItem<CoinSymbol>> get items => CoinSymbol.values
      .map<DropdownMenuItem<CoinSymbol>>(
        (e) => DropdownMenuItem(
          child: Center(
            child: Image.network(
              imageUrlFromCoinSymbol(e),
              width: 24,
              height: 24,
            ),
          ),
          value: e,
        ),
      )
      .toList(growable: false);
}
