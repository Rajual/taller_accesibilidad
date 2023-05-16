import 'package:taller_accesibilidad/domain/food/food.dart';

abstract class View {
  void showDetail(Food detailFood);
  // void showFoodFavorite(List<Widget> food);
}

abstract class Presenter {
  // void showFoodFavorite();
  Future<Food> initDetailFood(String foodName);
}

// abstract class Model {
//   List<Food> getFoodsFavorite();
//   Future<Food> getDetailFood(String foodName);
// }

abstract class Model {
  Future<Food> getDetailFood(String foodName);
}
