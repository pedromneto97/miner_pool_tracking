import 'package:flutter/material.dart';

import '../../../domain/domain.dart';

class ConfirmDelete extends StatelessWidget {
  final Wallet wallet;

  const ConfirmDelete({
    Key? key,
    required this.wallet,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Delete wallet?'),
      content: const Text('This will delete the wallet from saved wallets'),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('CANCEL'),
        ),
        TextButton(
          onPressed: () async {
            await const RemoveWalletUseCase().call(wallet);
            Navigator.of(context).pop();
          },
          child: const Text('ACCEPT'),
        ),
      ],
    );
  }
}
