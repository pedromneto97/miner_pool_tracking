import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../domain/domain.dart';
import '../../widgets/touchable_opacity.dart';
import '../app/app_router.dart';
import 'widgets/add_wallet/add_wallet_modal.dart';
import 'widgets/confirm_delete.dart';
import 'widgets/home_drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    const GetWalletsUseCase().call();
  }

  void onPressAdd() => showModalBottomSheet(
        context: context,
        builder: (context) => const AddWalletModal(),
        isScrollControlled: true,
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Profits',
        ),
      ),
      drawer: const HomeDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'My wallets',
                  style: Theme.of(context).textTheme.headline5,
                ),
                TouchableOpacity(
                  onTap: onPressAdd,
                  child: const Icon(Icons.add_circle_rounded),
                ),
              ],
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: ValueListenableBuilder<List<Wallet>>(
                  valueListenable: GetIt.I<WalletService>().notifier,
                  builder: (context, value, _) => ListView.separated(
                    itemBuilder: (context, index) => ListTile(
                      title: const Text('Address'),
                      subtitle: Text(value[index].address),
                      tileColor: Colors.grey[700],
                      onTap: () => AutoRouter.of(context).push(
                        MiningInfoRoute(wallet: value[index]),
                      ),
                      trailing: TouchableOpacity(
                        child: const Icon(Icons.delete_forever_outlined),
                        onTap: () => showDialog(
                          context: context,
                          builder: (context) => ConfirmDelete(
                            wallet: value[index],
                          ),
                        ),
                      ),
                    ),
                    itemCount: value.length,
                    separatorBuilder: (BuildContext context, int index) => const SizedBox(height: 8),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
