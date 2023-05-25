import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../../domain/food/food.dart';
import '../models/locale_model.dart';
import 'food_description_row_widget.dart';

class FoodDetailWidget extends StatelessWidget {
  const FoodDetailWidget(
      {super.key,
      required this.iconsDetails,
      required this.food,
      this.semanticOrdinal = double.maxFinite});

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
            icon: iconsDetails?.time,
            nameItem: food.time ?? '',
          ),
          FoodDescriptionRowWidget(
            icon: iconsDetails?.quantity,
            nameItem: food.quantity ?? '',
          ),
          FoodDescriptionRowWidget(
            icon: iconsDetails?.calories,
            nameItem: food.calories ?? '',
          ),
        ],
      ),
    );
  }
}
