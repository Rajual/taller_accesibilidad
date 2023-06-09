import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../../widgets/banners_widget.dart';
import '../../widgets/for_you_section_widget.dart';
import '../../widgets/search_food_food_widget.dart';
import '../detail_page/detail_page_view.dart';
import '../../../config/localizations.dart';
import 'home_page_presenter.dart';
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
    _presenter = HomePagePresenter(model: widget.model);
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
            Semantics(
              sortKey: const OrdinalSortKey(0),
              child: SizedBox(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.2,
                child: BannersWidget(
                    itemModel: languaje!.banner,
                    banners: _presenter.getBanners(),
                    action: () => getBanners(context)),
              ),
            ),
            SearchFoodFoodWidget(model: widget.model, search: languaje.search),
            LabelWidget(
              item: languaje?.categorySubtitle,
              style: const TextStyle(fontWeight: FontWeight.w700, height: 2.5),
            ),
            const FoodCategoryRowWidget(),
            const SizedBox(
              height: 20,
            ),
            ForYouSectionWidget(
              forYou: languaje!.forYou,
              seeMore: languaje.seeMore,
              foods: _presenter.getFoodForYou(),
              action: (label) => goToDetailsPage(context, label),
            )
          ],
        ),
        bottomNavigationBar:
            ExcludeSemantics(child: const CustomBottomNavigationBar()));
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
}
