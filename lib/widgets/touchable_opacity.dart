import 'package:flutter/material.dart';

class TouchableOpacity extends StatefulWidget {
  final VoidCallback onTap;
  final Widget child;

  const TouchableOpacity({
    Key? key,
    required this.onTap,
    required this.child,
  }) : super(key: key);

  @override
  State<TouchableOpacity> createState() => _TouchableOpacityState();
}

class _TouchableOpacityState extends State<TouchableOpacity> {
  final ValueNotifier<double> opacity = ValueNotifier<double>(1);

  @override
  void dispose() {
    opacity.dispose();
    super.dispose();
  }

  void setPressed([_]) => opacity.value = 0.3;

  void setReleased([_]) => opacity.value = 1;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: setPressed,
      onTapUp: setReleased,
      onTapCancel: setReleased,
      onTap: widget.onTap,
      child: ValueListenableBuilder<double>(
        valueListenable: opacity,
        child: widget.child,
        builder: (context, value, child) => AnimatedOpacity(
          child: child,
          duration: const Duration(milliseconds: 100),
          opacity: value,
        ),
      ),
    );
  }
}
