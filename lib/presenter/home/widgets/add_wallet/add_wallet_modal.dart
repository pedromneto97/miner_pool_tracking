import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../../domain/domain.dart';
import 'widgets/widgets.dart';

class AddWalletModal extends StatefulWidget {
  const AddWalletModal({Key? key}) : super(key: key);

  @override
  State<AddWalletModal> createState() => _AddWalletModalState();
}

class _AddWalletModalState extends State<AddWalletModal> {
  final controller = TextEditingController();
  final coinNotifier = ValueNotifier<CoinSymbol>(CoinSymbol.flux);
  final soloPoolNotifier = ValueNotifier<bool>(false);
  final consumptionController = TextEditingController(text: '');

  @override
  void dispose() {
    controller.dispose();
    coinNotifier.dispose();
    soloPoolNotifier.dispose();
    consumptionController.dispose();
    super.dispose();
  }

  void onSubmit([_]) async {
    await const AddWalletUseCase().call(
      address: controller.text,
      symbol: coinNotifier.value,
      isSolo: soloPoolNotifier.value,
      consumption: consumptionController.text.isNotEmpty ? int.parse(consumptionController.text) : 0,
    );
    context.router.pop();
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
                  child: CoinSymbolDropdown(
                    controller: coinNotifier,
                  ),
                ),
              ),
              onFieldSubmitted: onSubmit,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: ConsumptionInput(
                controller: consumptionController,
              ),
            ),
            SoloPoolCheckbox(
              controller: soloPoolNotifier,
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
