import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../../domain/food/food.dart';
import '../models/locale_model.dart';
import 'food_description_row_widget.dart';

class FoodDetailWidget extends StatelessWidget {
  const FoodDetailWidget({
    super.key,
    required this.iconsDetails,
    required this.food,
    this.semanticOrdinal=double.maxFinite
  });

  final IconsDetails? iconsDetails;
  final Food food;
  final double semanticOrdinal;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      focused: true,
      sortKey: OrdinalSortKey(semanticOrdinal),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          FoodDescriptionRowWidget(
            semanticOrdinal: 0,
            nameAssetIcon: iconsDetails?.time?.urlImage ?? '',
            nameItem: food.time ?? '',
            semantic: iconsDetails?.time?.semantic,
          ),
          FoodDescriptionRowWidget(
            semanticOrdinal: 2,
            nameAssetIcon: iconsDetails?.quantity?.urlImage ?? '',
            semantic: iconsDetails?.quantity?.semantic ?? '',
            nameItem: food.quantity ?? '',
          ),
          FoodDescriptionRowWidget(
            semanticOrdinal: 1,
            nameAssetIcon: iconsDetails?.calories?.urlImage ?? '',
            nameItem: '${food.calories ?? ''} calories',
            semantic: iconsDetails?.calories?.semantic,
          ),
        ],
      ),
    );
  }
}
