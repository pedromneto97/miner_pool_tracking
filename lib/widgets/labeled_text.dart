import 'package:flutter/material.dart';

class LabeledText extends StatelessWidget {
  final String label;
  final String text;
  final String tooltipMessage;

  const LabeledText({
    Key? key,
    required this.text,
    required this.label,
    this.tooltipMessage = '',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildLabelWidget(context),
        Text(
          text,
          style: Theme.of(context).textTheme.subtitle2,
        ),
      ],
    );
  }

  Widget _buildLabelWidget(BuildContext context) {
    final Text text = Text(
      label,
      style: Theme.of(context).textTheme.overline,
    );

    return tooltipMessage.isNotEmpty
        ? Row(
            children: [
              text,
              const SizedBox(width: 4),
              Tooltip(
                message: tooltipMessage,
                child: const Icon(
                  Icons.info_outline_rounded,
                  size: 16,
                ),
                triggerMode: TooltipTriggerMode.tap,
              ),
            ],
          )
        : text;
  }
}
