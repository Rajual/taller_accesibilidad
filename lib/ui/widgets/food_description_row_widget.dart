import 'package:flutter/material.dart';

import 'custom_item_icon.dart';
import 'label_widget.dart';

class FoodDescriptionRowWidget extends StatelessWidget {
  const FoodDescriptionRowWidget({
    super.key,
    required this.nameItem,
    required this.nameAssetIcon,
    this.semantic,
  });

  final String nameItem;
  final String nameAssetIcon;
  final String? semantic;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.008),
          child: CustomItemIcon(
            imageAssetIcon: nameAssetIcon,
            backgroundItemColor: const Color(0xFFF4AA4A),
            iconSize: 0.016,
          ),
        ),
        LabelWidget(
          label: nameItem,
          style: const TextStyle(
              color: Color(0xFFB6B6B6), fontSize: 12, letterSpacing: -0.31),
        ),
      ],
    );
  }
}
