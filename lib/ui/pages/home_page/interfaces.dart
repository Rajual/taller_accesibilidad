import 'package:flutter/material.dart';
import 'package:taller_accesibilidad/domain/banner/banner.dart';
import 'package:taller_accesibilidad/domain/food/food.dart';

abstract class View {
  void goToDetailsPage(BuildContext context, String foodDetailName);
  void showFoodForYou(List<Food> foodForYou);
  void getBanners(BuildContext context);
}

abstract class Presenter {
  Future<List<Food>> getFoodForYou();
  Future<List<BannerModel>> getBanners();
}

abstract class Model {
  Future<List<Food>> get foods;
  Future<List<BannerModel>> get banners;
  TextEditingController get searchTextEditingController;
}
