import 'package:flutter/material.dart';

import 'energy_cost_controller.dart';

class EnergyCost extends StatefulWidget {
  const EnergyCost({Key? key}) : super(key: key);

  @override
  _EnergyCostState createState() => _EnergyCostState();
}

class _EnergyCostState extends State<EnergyCost> {
  late final EnergyCostController energyCostController;

  @override
  void initState() {
    super.initState();
    energyCostController = EnergyCostController(context: context);
  }

  @override
  void dispose() {
    energyCostController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        label: const Text('Energy cost'),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        suffixText: '\$/kW',
        contentPadding: const EdgeInsets.all(16),
      ),
      controller: energyCostController.controller,
    );
  }
}
