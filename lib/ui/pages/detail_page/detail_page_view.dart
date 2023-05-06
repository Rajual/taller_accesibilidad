import 'package:flutter/widgets.dart';
import 'package:taller_accesibilidad/domain/food/food.dart';
import 'package:taller_accesibilidad/ui/pages/detail_page/detail_page_model.dart';
import 'package:taller_accesibilidad/ui/pages/detail_page/detail_page_presenter.dart';
import 'package:taller_accesibilidad/ui/pages/detail_page/interfacies.dart';

class DetailPageView extends StatefulWidget {
  const DetailPageView({required this.model, super.key});
  final DetailPageModel model;

  @override
  State<DetailPageView> createState() => _DetailPageViewState();
}

class _DetailPageViewState extends State<DetailPageView> implements View {
  late DetailPagePresenter pagePresenter;
  late List<Widget> foodFavorite;
  @override
  void initState() {
    super.initState();
    pagePresenter = DetailPagePresenter(model: widget.model, view: this);
    pagePresenter.showFoodFavorite();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: foodFavorite.length,
      itemBuilder: (context, index) {
        return foodFavorite[index];
      },
    );
  }

  @override
  void showDetail() {
    // TODO: implement setCategory
  }

  @override
  void showFoodFavorite(List<Widget> food) {
    foodFavorite = food;
  }
}
