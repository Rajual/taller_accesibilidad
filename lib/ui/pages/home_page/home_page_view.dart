import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:taller_accesibilidad/ui/models/locale_model.dart';

import '../../widgets/banners_widget.dart';
import '../../widgets/food_for_you_widget.dart';
import '../../widgets/search_food_food_widget.dart';
import '../detail_page/detail_page_view.dart';
import '../../../config/localizations.dart';
import 'home_page_presenter.dart';
import '../../../domain/food/food.dart';
import '../../widgets/custom_bottom_navigation_bar.dart';
import '../../widgets/food_category_row_widget.dart';
import '../../widgets/label_widget.dart';
import 'interfaces.dart';

class HomePage extends StatefulWidget {
  final Model model;
  const HomePage({super.key, required this.model});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> implements View {
  late final Widget myfoods;
  late final Presenter _presenter;
  @override
  void initState() {
    super.initState();
    _presenter = HomePagePresenter(view: this, model: widget.model);
  }

  int activePage = 0;
  @override
  Widget build(BuildContext context) {
    final languaje =
        MyAppLocalizations.of(context)?.getJsonTranslate().homeModel;
    return Scaffold(
        backgroundColor: Colors.white,
        body: ListView(
          padding: EdgeInsets.symmetric(
              vertical: MediaQuery.of(context).size.height * 0.1,
              horizontal: MediaQuery.of(context).size.width * 0.05),
          children: [
            LabelWidget(
              item: languaje?.title,
              style: const TextStyle(fontWeight: FontWeight.w700, height: 2.5),
            ),
            LabelWidget(
              item: languaje?.subTitle,
            ),
            SizedBox(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.2,
              child: BannersWidget(
                  banners: _presenter.getBanners(),
                  action: () => getBanners(context)),
            ),
            SearchFoodFoodWidget(widget: widget),
            LabelWidget(
              item: languaje?.categorySubtitle,
              style: const TextStyle(fontWeight: FontWeight.w700, height: 2.5),
            ),
            const FoodCategoryRowWidget(),
            const SizedBox(
              height: 20,
            ),
            AllAndYouWidget(
              forYou: languaje!.forYou,
              seeMore: languaje.seeMore,
              foods: _presenter.getFoodForYou(),
              action: (label) => goToDetailsPage(context, label),
            )
          ],
        ),
        bottomNavigationBar: const CustomBottomNavigationBar());
  }

  @override
  void goToDetailsPage(BuildContext context, String detailFoodName) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (BuildContext context) => DetailPageView(
              foodName: detailFoodName,
            )));
  }

  @override
  void getBanners(BuildContext context) async {
    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text('Banner deslizado')));
  }

  @override
  void showFoodForYou(List<Food> foodForYou) {
    // TODO: implement showFoodForYou
  }
}

class AllAndYouWidget extends StatelessWidget {
  final ItemModel forYou;
  final ItemModel seeMore;
  final Future<List<Food>> foods;
  final void Function(String)? action;
  const AllAndYouWidget(
      {super.key,
      required this.forYou,
      required this.seeMore,
      required this.foods,
      this.action});

  @override
  Widget build(BuildContext context) {
    return Semantics(
      sortKey: OrdinalSortKey(forYou.semanticOrdinal),
      focused: true,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              LabelWidget(
                item: forYou,
                style: const TextStyle(
                  fontWeight: FontWeight.w700,
                ),
              ),
              LabelWidget(
                item: seeMore,
                style: const TextStyle(color: Color(0xFFF4AA4A)),
              ),
            ],
          ),
          SizedBox(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.5,
            child: FoodForYouWidget(
              action: (label) => action?.call(label),
              foods: foods,
            ),
          )
        ],
      ),
    );
  }
}
