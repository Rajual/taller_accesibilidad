import 'package:flutter/material.dart';
import 'package:taller_accesibilidad/ui/widgets/label_widget.dart';

import 'custom_item_icon.dart';

class FoodCategoryRowWidget extends StatelessWidget {
  const FoodCategoryRowWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: const [
            CustomItemIcon(
              imageAssetIcon: 'assets/images/main.png',
              iconSize: 0.05,
            ),
            LabelWidget(label: 'Main'),
          ],
        ),
        Column(
          children: const [
            CustomItemIcon(
              imageAssetIcon: 'assets/images/salad.png',
              iconSize: 0.05,
            ),
            LabelWidget(label: 'Salad'),
          ],
        ),
        Column(
          children: const [
            CustomItemIcon(
              imageAssetIcon: 'assets/images/appetizer.png',
              iconSize: 0.05,
            ),
            LabelWidget(label: 'Appetizer'),
          ],
        ),
        Column(
          children: const [
            CustomItemIcon(
              imageAssetIcon: 'assets/images/drinks.png',
              iconSize: 0.05,
            ),
            LabelWidget(label: 'Drinks'),
          ],
        ),
        Column(
          children: const [
            CustomItemIcon(
              imageAssetIcon: 'assets/images/dessert.png',
              iconSize: 0.05,
            ),
            LabelWidget(label: 'Dessert'),
          ],
        )
      ],
    );
  }
}
