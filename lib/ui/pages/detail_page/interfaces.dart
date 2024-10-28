import 'package:taller_accesibilidad/domain/food/food.dart';

abstract class ViewInterface {
  void showDetail(Food detailFood);
  // void showFoodFavorite(List<Widget> food);
}

abstract class PresenterInterface {
  Future<Food> initDetailFood(String foodName);
}

abstract class ModelInterface {
  Future<Food> getDetailFood(String foodName);
}
