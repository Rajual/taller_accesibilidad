import 'package:taller_accesibilidad/ui/pages/detail_page/interfaces.dart';

import '../../../domain/food/food.dart';

class DetailPagePresenter implements Presenter {
  DetailPagePresenter({
    required this.model,
    required this.view,
  });
  final Model model;
  final View view;
  // @override
  // void showFoodFavorite() {
  //   view.showFoodFavorite(
  //       model.getFoodsFavorite().map((e) => Text(e.name)).toList());
  // }

  @override
  Future<Food> initDetailFood(String foodName) async {
    final Food currentFood = await model.getDetailFood(foodName);
    view.showDetail(currentFood);
    return currentFood;
  }
}
