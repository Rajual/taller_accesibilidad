import 'package:flutter/material.dart';
import 'package:taller_accesibilidad/ui/models/locale_model.dart';
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
        Semantics(
          focusable: false,
          child: const Column(
            children: [
              CustomItemIcon(
                imageAssetIcon: 'assets/images/main.png',
                iconSize: 0.05,
              ),
              LabelWidget(
                item: ItemModel(label: 'Principales'),
              ),
            ],
          ),
        ),
        Semantics(
          focusable: true,
          child: const Column(
            children: [
              CustomItemIcon(
                imageAssetIcon: 'assets/images/salad.png',
                iconSize: 0.05,
              ),
              LabelWidget(
                item: ItemModel(label: 'Ensaladas'),
              ),
            ],
          ),
        ),
        Semantics(
          focusable: true,
          child: const Column(
            children: [
              CustomItemIcon(
                imageAssetIcon: 'assets/images/appetizer.png',
                iconSize: 0.05,
              ),
              LabelWidget(
                item: ItemModel(label: 'Aperitivos'),
              ),
            ],
          ),
        ),
        Semantics(
          focusable: true,
          child: const Column(
            children: [
              CustomItemIcon(
                imageAssetIcon: 'assets/images/drinks.png',
                iconSize: 0.05,
              ),
              LabelWidget(
                item: ItemModel(label: 'Bebidas'),
              ),
            ],
          ),
        ),
        Semantics(
          focusable: true,
          child: const Column(
            children: [
              CustomItemIcon(
                imageAssetIcon: 'assets/images/dessert.png',
                iconSize: 0.05,
              ),
              LabelWidget(
                item: ItemModel(label: 'Postres'),
              ),
            ],
          ),
        )
      ],
    );
  }
}
