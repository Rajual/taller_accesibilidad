import 'package:flutter/material.dart';
import 'package:taller_accesibilidad/ui/models/locale_model.dart';

import 'custom_item_icon.dart';
import 'label_widget.dart';

class FoodDescriptionRowWidget extends StatelessWidget {
  const FoodDescriptionRowWidget({
    super.key,
    required this.icon,
    required this.nameItem,
  });
  final IconModel? icon;
  final String nameItem;

  @override
  Widget build(BuildContext context) {
    if (icon == null || icon?.urlImage == null) {
      return const SizedBox.shrink();
    }
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.008),
          child: CustomItemIcon(
            imageAssetIcon: icon!.urlImage!,
            backgroundItemColor: const Color(0xFFF4AA4A),
            iconSize: 0.016,
          ),
        ),
        Flexible(
          child: LabelWidget(
            item: ItemModel(
                semanticOrdinal: icon!.semanticOrdinal,
                semantic: '${icon!.semantic} $nameItem',
                label: nameItem),
            style: const TextStyle(
                color: Color(0xFFB6B6B6), fontSize: 12, letterSpacing: -0.31),
          ),
        ),
      ],
    );
  }
}
