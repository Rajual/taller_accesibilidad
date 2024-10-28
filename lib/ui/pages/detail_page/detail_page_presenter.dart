import 'package:taller_accesibilidad/ui/pages/detail_page/interfaces.dart';

import '../../../domain/food/food.dart';

class DetailPagePresenter implements PresenterInterface {
  DetailPagePresenter({
    required this.model,
    required this.view,
  });
  final ModelInterface model;
  final ViewInterface view;

  @override
  Future<Food> initDetailFood(String foodName) async {
    final Food currentFood = await model.getDetailFood(foodName);
    view.showDetail(currentFood);
    return currentFood;
  }
}
