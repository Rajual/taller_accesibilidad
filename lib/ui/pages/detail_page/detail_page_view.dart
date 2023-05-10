import 'package:flutter/material.dart';
import 'package:taller_accesibilidad/ui/pages/detail_page/detail_page_model.dart';
import 'package:taller_accesibilidad/ui/pages/detail_page/detail_page_presenter.dart';
import 'package:taller_accesibilidad/ui/pages/detail_page/interfaces.dart';

import '../../../domain/food/food.dart';

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
            return Center(
              child: Column(
                children: [
                  Image.asset(
                    snapshot.data.imageUrl,
                    width: MediaQuery.of(context).size.width * 0.7,
                  ),
                  Text(
                    snapshot.data.name,
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
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Row(
                      children: [],
                    ),
                  ),
                ],
              ),
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
