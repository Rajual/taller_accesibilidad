import 'package:flutter/material.dart';
import 'package:taller_accesibilidad/domain/food/food.dart';

import '../../../domain/food/food_gateway.dart';

abstract class View {
  void goToDetailsPage(BuildContext context, String foodDetailName);
  void showFoodForYou(List<Food> foodForYou);
}

abstract class Presenter {
  Future<List<Food>> getFoodForYou();
}

abstract class Model {
  Future<List<Food>> get foods;
}
