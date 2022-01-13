import 'package:flutter/material.dart';

class CardInfo extends StatelessWidget {
  final String title;
  final String subtitle;

  const CardInfo({
    Key? key,
    required this.title,
    required this.subtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Container(
        width: 112,
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              title,
              textAlign: TextAlign.left,
              style: Theme.of(context).textTheme.caption,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(
                subtitle,
                style: Theme.of(context).textTheme.headline5,
                textAlign: TextAlign.left,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
