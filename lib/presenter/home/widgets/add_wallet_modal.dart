import 'package:flutter/material.dart';

import '../../../domain/domain.dart';

class AddWalletModal extends StatefulWidget {
  const AddWalletModal({Key? key}) : super(key: key);

  @override
  State<AddWalletModal> createState() => _AddWalletModalState();
}

class _AddWalletModalState extends State<AddWalletModal> {
  final controller = TextEditingController();
  final coinNotifier = ValueNotifier<CoinSymbol>(CoinSymbol.flux);
  final soloPoolNotifier = ValueNotifier<bool>(false);

  @override
  void dispose() {
    controller.dispose();
    coinNotifier.dispose();
    soloPoolNotifier.dispose();
    super.dispose();
  }

  void onSubmit([_]) async {
    await const AddWalletUseCase().call(
      address: controller.text,
      symbol: coinNotifier.value,
      isSolo: soloPoolNotifier.value,
    );
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MediaQuery.of(context).viewInsets.add(const EdgeInsets.all(16.0)),
      child: Form(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              controller: controller,
              decoration: InputDecoration(
                label: const Text('Address'),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                prefixIcon: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: ValueListenableBuilder<CoinSymbol>(
                    valueListenable: coinNotifier,
                    builder: (context, value, child) {
                      return DropdownButton<CoinSymbol>(
                        alignment: Alignment.center,
                        iconSize: 16,
                        items: CoinSymbol.values
                            .map<DropdownMenuItem<CoinSymbol>>(
                              (e) => DropdownMenuItem(
                                child: Center(
                                  child: Image.network(
                                    'https://minerpool.org/images/${e.name}.png',
                                    width: 24,
                                    height: 24,
                                    cacheHeight: 160,
                                    cacheWidth: 160,
                                  ),
                                ),
                                value: e,
                              ),
                            )
                            .toList(growable: false),
                        onChanged: (newValue) => coinNotifier.value = newValue!,
                        value: value,
                      );
                    },
                  ),
                ),
              ),
              onFieldSubmitted: onSubmit,
            ),
            ValueListenableBuilder<bool>(
              valueListenable: soloPoolNotifier,
              child: const Text('Is solo pool'),
              builder: (context, value, child) => CheckboxListTile(
                value: value,
                onChanged: (value) => soloPoolNotifier.value = value!,
                title: child,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: LayoutBuilder(
                builder: (context, constraints) {
                  return SizedBox(
                    width: constraints.maxWidth,
                    child: ElevatedButton(
                      onPressed: onSubmit,
                      child: const Text('Add wallet'),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
