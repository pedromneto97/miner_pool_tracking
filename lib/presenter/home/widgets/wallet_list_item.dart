import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../domain/domain.dart';
import '../../../utils/image_utils.dart';
import '../../../utils/string_extension.dart';
import '../../../widgets/widgets.dart';
import '../../app/app_router.dart';
import 'confirm_delete.dart';

class WalletListItem extends StatelessWidget {
  final Wallet wallet;
  const WalletListItem({
    Key? key,
    required this.wallet,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Hero(
        tag: 'coin_image_${wallet.address}',
        child: Image.network(
          imageUrlFromCoinSymbol(
            wallet.symbol,
          ),
          height: 40,
          width: 40,
        ),
      ),
      title: Hero(
        tag: 'wallet_type_${wallet.address}',
        child: Text(
          '${wallet.symbol.name.capitalize()} wallet',
          style: Theme.of(context).textTheme.bodyText1,
        ),
      ),
      subtitle: Text(wallet.address),
      tileColor: Colors.grey[700],
      onTap: () => AutoRouter.of(context).push(
        MiningInfoRoute(wallet: wallet),
      ),
      trailing: TouchableOpacity(
        child: const Icon(Icons.delete_forever_outlined),
        onTap: () => showDialog(
          context: context,
          builder: (context) => ConfirmDelete(
            wallet: wallet,
          ),
        ),
      ),
    );
  }
}
