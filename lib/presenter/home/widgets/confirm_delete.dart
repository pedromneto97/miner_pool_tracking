import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

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
          onPressed: context.router.pop,
          child: const Text('CANCEL'),
        ),
        TextButton(
          onPressed: () async {
            await GetIt.I.get<RemoveWalletUseCase>().call(wallet);
            context.router.pop();
          },
          child: const Text('ACCEPT'),
        ),
      ],
    );
  }
}
