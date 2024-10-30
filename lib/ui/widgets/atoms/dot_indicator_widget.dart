import 'package:flutter/material.dart';

class DotIndicatorWidget extends StatelessWidget {
  const DotIndicatorWidget({
    super.key,
    required this.isCurrentIndex,
  });

  final bool isCurrentIndex;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(3),
      width: 10,
      height: 10,
      decoration: BoxDecoration(
          color: isCurrentIndex
              ? const Color(0xFFF4AA4A)
              : const Color(0xFFFFFFFF),
          shape: BoxShape.circle),
    );
  }
}
