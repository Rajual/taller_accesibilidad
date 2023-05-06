import 'package:flutter/material.dart';
import 'package:taller_accesibilidad/domain/food/food.dart';

abstract class View {
  void showDetail();
  void showFoodFavorite(List<Widget> food);
}

abstract class Presenter {
  void showFoodFavorite();
}

abstract class Model {
  List<Food> getFoodsFavorite();
}
