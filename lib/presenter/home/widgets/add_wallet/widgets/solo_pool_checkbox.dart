import 'package:flutter/material.dart';

class SoloPoolCheckbox extends StatelessWidget {
  final ValueNotifier<bool> controller;

  const SoloPoolCheckbox({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: controller,
      child: const Text('Is solo pool'),
      builder: (context, value, child) => CheckboxListTile(
        value: value,
        onChanged: onChanged,
        title: child,
      ),
    );
  }

  void onChanged(bool? value) => controller.value = value!;
}
