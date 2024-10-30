import 'package:taller_accesibilidad/domain/food/usecase/food_usecase.dart';
import 'package:taller_accesibilidad/ui/pages/detail_page/interfaces.dart';

import '../../domain/food/food.dart';

class DetailPagePresenter {
  DetailPagePresenter({
    required this.usecase,
    required this.view,
  });
  final FoodUsecase usecase;
  final ViewInterface view;

  Future<Food> initDetailFood(String foodName) async {
    final Food currentFood = await usecase.getDetailFood(foodName);
    view.showDetail(currentFood);
    return currentFood;
  }
}
