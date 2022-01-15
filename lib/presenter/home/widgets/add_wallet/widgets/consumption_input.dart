import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ConsumptionInput extends StatelessWidget {
  final TextEditingController controller;
  const ConsumptionInput({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        label: const Text('Consumption'),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        suffixText: 'W',
        contentPadding: const EdgeInsets.all(16),
      ),
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
      ],
      keyboardType: TextInputType.number,
    );
  }
}
