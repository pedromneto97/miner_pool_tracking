import 'package:flutter/material.dart';

class LabeledText extends StatelessWidget {
  final String label;
  final String text;
  const LabeledText({
    Key? key,
    required this.text,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        text: label,
        style: Theme.of(context).textTheme.bodyText1,
        children: [
          TextSpan(
            text: text,
            style: Theme.of(context).textTheme.bodyText2,
          ),
        ],
      ),
    );
  }
}
