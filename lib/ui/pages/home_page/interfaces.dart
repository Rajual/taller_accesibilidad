import 'package:flutter/material.dart';
import 'package:taller_accesibilidad/domain/banner/banner.dart';
import 'package:taller_accesibilidad/domain/food/food.dart';

abstract class ViewInterface {
  void goToDetailsPage(BuildContext context, String foodDetailName);
  void getBanners(BuildContext context);
}

abstract class PresenterInterface {
  Future<List<Food>> getFoodForYou();
  Future<List<BannerModel>> getBanners();
}

abstract class ModelInterface {
  Future<List<Food>> get foods;
  Future<List<BannerModel>> get banners;
  TextEditingController get searchTextEditingController;
}
