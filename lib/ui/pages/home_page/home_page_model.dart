import 'package:flutter/material.dart';
import 'package:taller_accesibilidad/domain/banner/banner.dart';
import 'package:taller_accesibilidad/domain/food/food.dart';
import 'package:taller_accesibilidad/ui/pages/home_page/interfaces.dart';

import '../../../domain/banner/banner_gateway.dart';
import '../../../domain/food/food_gateway.dart';

class HomePageModel implements ModelInterface {
  HomePageModel({required this.foodGateway, required this.bannerGateway});
  final FoodGateway foodGateway;
  final BannerGateway bannerGateway;

  @override
  final TextEditingController searchTextEditingController =
      TextEditingController();

  @override
  Future<List<Food>> get foods => foodGateway.getFood();

  @override
  Future<List<BannerModel>> get banners => bannerGateway.getBanners();
}
