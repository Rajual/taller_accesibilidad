import 'package:taller_accesibilidad/domain/food_category/food_category.dart';

abstract class FoodCategoryGateway {
  List<FoodCategory> getFoodCategory();
  List<FoodCategory> getBetterFoodCategory();
}
