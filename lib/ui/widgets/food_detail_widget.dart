import 'package:flutter/material.dart';

import '../../domain/food/food.dart';
import '../models/locale_model.dart';
import 'food_description_row_widget.dart';

class FoodDetailWidget extends StatelessWidget {
  const FoodDetailWidget({
    super.key,
    required this.iconsDetails,
    required this.food,
  });

  final IconsDetails? iconsDetails;
  final Food food;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        FoodDescriptionRowWidget(
          nameAssetIcon: iconsDetails?.time?.urlImage ?? '',
          nameItem: food.time ?? '',
          semantic: iconsDetails?.time?.semantic,
        ),
        FoodDescriptionRowWidget(
          nameAssetIcon: iconsDetails?.quantity?.urlImage ?? '',
          semantic: iconsDetails?.quantity?.semantic ?? '',
          nameItem: food.quantity ?? '',
        ),
        FoodDescriptionRowWidget(
          nameAssetIcon: iconsDetails?.calories?.urlImage ?? '',
          nameItem: '${food.calories ?? ''} calories',
          semantic: iconsDetails?.calories?.semantic,
        ),
      ],
    );
  }
}
