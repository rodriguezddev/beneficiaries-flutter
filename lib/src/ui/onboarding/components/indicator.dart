import 'package:flutter/material.dart';

class IndicatorContent extends StatelessWidget {
  const IndicatorContent({
    Key? key,
    required this.isActive,
}) : super(key: key);

  final bool isActive;

  @override
  Widget build(BuildContext context) {
     return AnimatedContainer(
      duration: const Duration(milliseconds: 150),
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      height: isActive ? 8.0 : 4.0,
      width: isActive ? 8.0 : 4.0,
      decoration: BoxDecoration(
        color: isActive ? Colors.blue : Colors.grey,
        borderRadius: const BorderRadius.all(
          Radius.circular(12),
        ),
      ),
    );
  }
}
