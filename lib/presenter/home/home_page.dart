import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../domain/domain.dart';
import '../../widgets/touchable_opacity.dart';
import 'widgets/widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) => GetIt.I.get<GetWalletsUseCase>().call());
  }

  void onPressAdd() => showModalBottomSheet(
        context: context,
        builder: (context) => const AddWalletModal(),
        isScrollControlled: true,
      );

  Widget separatorBuilder(BuildContext context, int index) => const SizedBox(height: 8);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
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
                    itemBuilder: (context, index) => WalletListItem(
                      wallet: value[index],
                    ),
                    itemCount: value.length,
                    separatorBuilder: separatorBuilder,
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
