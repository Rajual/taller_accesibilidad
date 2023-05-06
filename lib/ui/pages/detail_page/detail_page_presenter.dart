import 'package:flutter/widgets.dart';
import 'package:taller_accesibilidad/ui/pages/detail_page/interfacies.dart';

class DetailPagePresenter implements Presenter {
  const DetailPagePresenter({required this.model, required this.view});
  final Model model;
  final View view;
  @override
  void showFoodFavorite() {
    view.showFoodFavorite(
        model.getFoodsFavorite().map((e) => Text(e.name)).toList());
  }
}
