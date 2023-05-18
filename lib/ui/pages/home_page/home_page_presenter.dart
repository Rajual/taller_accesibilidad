import 'package:taller_accesibilidad/domain/banner/banner.dart';
import 'package:taller_accesibilidad/ui/pages/home_page/interfaces.dart';

import '../../../domain/food/food.dart';

class HomePagePresenter implements Presenter {
  HomePagePresenter({required View view, required Model model})
      : _model = model,
        _view = view;
  final View _view;
  final Model _model;
  @override
  Future<List<Food>> getFoodForYou() async {
    final List<Food> foods = [];

    for (var element in await _model.foods) {
      foods.add(element);
    }
    _view.showFoodForYou(foods);
    return foods;
  }

  @override
  Future<List<BannerModel>> getBanners() async {
    return await _model.banners;
  }
}
