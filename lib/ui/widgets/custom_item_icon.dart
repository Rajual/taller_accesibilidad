import 'package:flutter/material.dart';

class CustomItemIcon extends StatelessWidget {
  final String imageAssetIcon;
  final double iconSize;
  final Color? backgroundItemColor;
  const CustomItemIcon({
    super.key,
    required this.imageAssetIcon,
    required this.iconSize,
    this.backgroundItemColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(9.0),
      decoration: BoxDecoration(
          color: backgroundItemColor ?? const Color.fromARGB(0, 255, 255, 255),
          borderRadius: BorderRadius.circular(30)),
      child: Image.asset(
        imageAssetIcon,
        height: MediaQuery.of(context).size.height * iconSize,
      ),
    );
  }
}
