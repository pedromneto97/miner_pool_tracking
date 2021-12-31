import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:get_it/get_it.dart';

import '../../../../domain/domain.dart';

class EnergyCostController {
  final BuildContext context;
  Timer? _debounce;

  final MoneyMaskedTextController controller = MoneyMaskedTextController(
    initialValue: GetIt.I<SettingsService>().settings.energyCost,
  );

  EnergyCostController({required this.context}) {
    controller.afterChange = _onValueChanged;
  }

  void dispose() {
    _debounce?.cancel();
    controller.dispose();
  }

  void _onValueChanged(String _, double value) {
    if (_debounce?.isActive ?? false) {
      _debounce!.cancel();
    }
    _debounce = Timer(
      const Duration(milliseconds: 700),
      () async {
        await GetIt.I<SettingsService>().changeEnergyCost(value);

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Energy cost saved'),
            behavior: SnackBarBehavior.floating,
            duration: Duration(seconds: 1),
          ),
        );
      },
    );
  }
}
