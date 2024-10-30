import 'package:taller_accesibilidad/domain/banner/banner.dart';
import 'package:taller_accesibilidad/ui/interfaces/home_page_interface.dart';

import '../../domain/banner/usecase/banner_usecase.dart';
import '../../domain/food/food.dart';
import '../../domain/food/usecase/food_usecase.dart';

class HomePagePresenter {
  HomePagePresenter(
      {required HomePageInterface interface,
      required BannerUsecase bannerUsercase,
      required FoodUsecase fooUsecase})
      : _interface = interface,
        _bannerUsecase = bannerUsercase,
        _foodUsecase = fooUsecase;
  final HomePageInterface _interface;
  final BannerUsecase _bannerUsecase;
  final FoodUsecase _foodUsecase;

  Future<List<Food>> getFoodForYou() async {
    final List<Food> foods = [];

    for (var element in await _foodUsecase.foods) {
      foods.add(element);
    }
    return foods;
  }

  Future<List<BannerModel>> getBanners() async {
    return await _bannerUsecase.banners;
  }
}
