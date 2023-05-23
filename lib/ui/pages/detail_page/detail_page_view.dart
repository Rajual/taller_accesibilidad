import 'package:flutter/material.dart';
import 'package:taller_accesibilidad/ui/pages/detail_page/detail_page_model.dart';
import 'package:taller_accesibilidad/ui/pages/detail_page/detail_page_presenter.dart';
import 'package:taller_accesibilidad/ui/pages/detail_page/interfaces.dart';
import 'package:taller_accesibilidad/ui/widgets/label_widget.dart';

import '../../../config/localizations.dart';
import '../../../domain/food/food.dart';
import '../../widgets/food_detail_widget.dart';
import '../../widgets/food_recipe_widget.dart';

class DetailPageView extends StatefulWidget {
  const DetailPageView({required this.foodName, super.key});
  final String foodName;

  @override
  State<DetailPageView> createState() => _DetailPageViewState();
}

class _DetailPageViewState extends State<DetailPageView> implements View {
  late DetailPagePresenter pagePresenter;
  late List<Widget> foodFavorite;
  late Food currentFood;

  @override
  void initState() {
    super.initState();
    pagePresenter =
        DetailPagePresenter(model: const DetailPageModel(), view: this);
  }

  @override
  Widget build(BuildContext context) {
    final languaje =
        MyAppLocalizations.of(context)?.getJsonTranslate().detailModel;
    return Scaffold(
      backgroundColor: const Color(0xFFF4AA4A),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF4AA4A),
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back_rounded),
        ),
      ),
      body: FutureBuilder<Food>(
        future: pagePresenter.initDetailFood(widget.foodName),
        builder: (BuildContext context, AsyncSnapshot<Food> snapshot) {
          if (snapshot.hasData) {
            return ListView(
              children: [
                Image.asset(
                  snapshot.data?.imageUrl ?? '',
                  height: MediaQuery.of(context).size.height * 0.3,
                ),
                LabelWidget(
                  semanticOrdinal: 0.0,
                  label: snapshot.data?.name ?? '',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize:
                          Theme.of(context).textTheme.headlineLarge!.fontSize,
                      letterSpacing: -2.5),
                ),
                LabelWidget(
                  label: languaje?.subTitle.label ?? '',
                  labelSemantic: languaje?.subTitle.semantic,
                  style: const TextStyle(color: Colors.white),
                  textAlign: TextAlign.center,
                ),
                Container(
                  margin: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.07,
                      vertical: MediaQuery.of(context).size.height * 0.02),
                  padding: EdgeInsets.symmetric(
                      vertical: MediaQuery.of(context).size.height * 0.015,
                      horizontal: MediaQuery.of(context).size.width * 0.06),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(35),
                  ),
                  child: FoodDetailWidget(
                      iconsDetails: languaje?.iconsDetails,
                      food: snapshot.data!),
                ),
                FoodRecipeWidget(
                    semanticOrdinal: 1.0,
                    description: languaje?.description,
                    ingredients: languaje?.ingredients,
                    food: snapshot.data),
              ],
            );
          } else {
            return const CircularProgressIndicator();
          }
        },
      ),
    );
  }

  @override
  void showDetail(Food detailFood) {
    currentFood = detailFood;
  }
}
