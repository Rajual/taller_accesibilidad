import 'package:flutter/material.dart';
import 'package:taller_accesibilidad/ui/pages/detail_page/detail_page_model.dart';
import 'package:taller_accesibilidad/ui/pages/detail_page/detail_page_presenter.dart';
import 'package:taller_accesibilidad/ui/pages/detail_page/interfaces.dart';

import '../../../domain/food/food.dart';
import '../../widgets/custom_item_icon.dart';

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
      body: FutureBuilder(
        future: pagePresenter.initDetailFood(widget.foodName),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasData) {
            return ListView(
              children: [
                Image.asset(
                  snapshot.data.imageUrl,
                  height: MediaQuery.of(context).size.height * 0.3,
                ),
                Text(
                  snapshot.data.name,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize:
                          Theme.of(context).textTheme.headlineLarge!.fontSize,
                      letterSpacing: -2.5),
                ),
                const Text(
                  'Cooking Healthy for Radiant Health',
                  style: TextStyle(color: Colors.white),
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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      FoodDescriptionRowWidget(
                        nameAssetIcon: 'assets/images/clock_icon.png',
                        nameItem: snapshot.data.time,
                      ),
                      FoodDescriptionRowWidget(
                        nameAssetIcon: 'assets/images/fork_icon.png',
                        nameItem:
                            'For ${snapshot.data.quantity} ${snapshot.data.quantity > 1 ? 'people' : 'person'}',
                      ),
                      FoodDescriptionRowWidget(
                        nameAssetIcon: 'assets/images/bolt_icon.png',
                        nameItem: '${snapshot.data.calories} calories',
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.07),
                  padding: EdgeInsets.symmetric(
                      vertical: MediaQuery.of(context).size.height * 0.015,
                      horizontal: MediaQuery.of(context).size.width * 0.06),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(35),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Description',
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 17,
                            letterSpacing: -0.67),
                      ),
                      Text(
                        snapshot.data.description,
                        style: const TextStyle(
                          fontSize: 13,
                          letterSpacing: -0.67,
                          color: Color(0xFFB6B6B6),
                        ),
                      ),
                      const Text(
                        'Ingredients',
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 17,
                            letterSpacing: -0.67),
                      ),
                      SizedBox(
                        height: 170.0,
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: snapshot.data.ingredients.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Row(children: [
                              Container(
                                margin: const EdgeInsets.all(3),
                                padding: const EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  color: const Color(0xFFEA4F46),
                                  borderRadius: BorderRadius.circular(50),
                                ),
                              ),
                              Text(
                                '${snapshot.data.ingredients[index].quantity} ${snapshot.data.ingredients[index].unitMeasure} ${snapshot.data.ingredients[index].name}',
                                style: const TextStyle(
                                    color: Color(0xFFB6B6B6),
                                    letterSpacing: -0.67),
                              ),
                            ]);
                            // return SizedBox(
                            //   width: 500.0,
                            //   height: 200.0,
                            //   child: ListTile(
                            //     trailing: Container(
                            //       decoration: BoxDecoration(
                            //         color: const Color(0xFFEA4F46),
                            //         borderRadius: BorderRadius.circular(50),
                            //       ),
                            //     ),
                            //     title: Text(
                            //       '${snapshot.data.ingredients[index].quantity} ${snapshot.data.ingredients[index].unitMeasure} ${snapshot.data.ingredients[index].name}',
                            //       style: const TextStyle(
                            //           color: Color(0xFFB6B6B6),
                            //           letterSpacing: -0.67),
                            //     ),
                            //   ),
                            // );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
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

  // @override
  // void showFoodFavorite(List<Widget> food) {
  //   foodFavorite = food;
  // }
}

class FoodDescriptionRowWidget extends StatelessWidget {
  const FoodDescriptionRowWidget({
    super.key,
    required this.nameItem,
    required this.nameAssetIcon,
  });

  final String nameItem;
  final String nameAssetIcon;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.008),
          child: CustomItemIcon(
            imageAssetIcon: nameAssetIcon,
            backgroundItemColor: const Color(0xFFF4AA4A),
            iconSize: 0.016,
          ),
        ),
        Text(
          nameItem,
          style: const TextStyle(
              color: Color(0xFFB6B6B6), fontSize: 12, letterSpacing: -0.31),
        ),
      ],
    );
  }
}
