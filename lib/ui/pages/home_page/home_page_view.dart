import 'package:flutter/material.dart';
import 'package:taller_accesibilidad/domain/banner/banner.dart';

import 'package:taller_accesibilidad/ui/pages/detail_page/detail_page_view.dart';
import 'package:taller_accesibilidad/config/localizations.dart';
import 'package:taller_accesibilidad/ui/pages/home_page/home_page_presenter.dart';
import '../../../domain/food/food.dart';
import '../../widgets/custom_bottom_navigation_bar.dart';
import '../../widgets/custom_item_icon.dart';
import '../../widgets/food_category_row_widget.dart';
import 'interfaces.dart';

class HomePage extends StatefulWidget {
  final TextEditingController searchTextEditingController;
  final Model model;
  const HomePage(
      {super.key,
      required this.searchTextEditingController,
      required this.model});

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
            Semantics(
              label: languaje?.title.semantic ?? '',
              excludeSemantics: true,
              child: Text(
                languaje?.title.label ?? '',
                style:
                    const TextStyle(fontWeight: FontWeight.w700, height: 2.5),
              ),
            ),
            const Text("Let's grab your food!"),
            SizedBox(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.2,
              child: FutureBuilder(
                future: _presenter.getBanners(),
                builder:
                    (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                  if (snapshot.hasData) {
                    return Stack(
                      children: [
                        PageView.builder(
                          itemCount: snapshot.data.length,
                          pageSnapping: true,
                          onPageChanged: (value) {
                            setState(() {
                              activePage = value;
                              getBanners(context);
                            });
                          },
                          itemBuilder: (context, index) {
                            return Container(
                              margin: EdgeInsets.symmetric(
                                  horizontal:
                                      MediaQuery.of(context).size.width * 0.01),
                              child: Image.asset(snapshot.data[index].urlPhoto),
                            );
                          },
                        ),
                        Positioned(
                          bottom: MediaQuery.of(context).size.height * 0.02,
                          left: MediaQuery.of(context).size.width * 0.39,
                          child: Row(
                            children:
                                indicators(snapshot.data.length, activePage),
                          ),
                        ),
                      ],
                    );
                  } else {
                    return const CircularProgressIndicator();
                  }
                },
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: const Color(0xFFF9F9F9)),
              child: TextField(
                controller: widget.searchTextEditingController,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  prefixIcon: Icon(Icons.search),
                  prefixIconColor: Color(0xFFF4AA4A),
                  hintText: 'Search for food',
                  hintStyle: TextStyle(color: Colors.black),
                ),
              ),
            ),
            const Text(
              'Food Category',
              style: TextStyle(fontWeight: FontWeight.w700, height: 2.5),
            ),
            const FoodCategoryRowWidget(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  'Food for you',
                  style: TextStyle(fontWeight: FontWeight.w700, height: 2.5),
                ),
                Text(
                  'See all',
                  style: TextStyle(color: Color(0xFFF4AA4A)),
                ),
              ],
            ),
            SizedBox(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.5,
              child: FutureBuilder<List<Food>>(
                future: _presenter.getFoodForYou(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const CircularProgressIndicator();
                  }
                  return GridView.builder(
                    itemCount: snapshot.data?.length,
                    padding: EdgeInsets.symmetric(
                        vertical: MediaQuery.of(context).size.height * 0.02),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing:
                            MediaQuery.of(context).size.height * 0.02),
                    itemBuilder: (context, index) {
                      return FoodGridWidget(
                        callbackNavigation: () {
                          goToDetailsPage(context, snapshot.data![index].name);
                        },
                        food: snapshot.data![index],
                      );
                    },
                  );
                },
              ),
            )
          ],
        ),
        bottomNavigationBar: const CustomBottomNavigationBar());
  }

  List<Widget> indicators(imagesLength, currentIndex) {
    return List<Widget>.generate(imagesLength, (index) {
      return Container(
        margin: const EdgeInsets.all(3),
        width: 10,
        height: 10,
        decoration: BoxDecoration(
            color: currentIndex == index
                ? const Color(0xFFF4AA4A)
                : const Color(0xFFFFFFFF),
            shape: BoxShape.circle),
      );
    });
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
        .showSnackBar(const SnackBar(content: Text('Banner dragged')));
  }

  @override
  void showFoodForYou(List<Food> foodForYou) {
    // TODO: implement showFoodForYou
  }
}

class FoodGridWidget extends StatelessWidget {
  const FoodGridWidget(
      {super.key, required this.food, required this.callbackNavigation});
  final Food food;
  final VoidCallback? callbackNavigation;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: '${food.name} ${food.price}',
      child: GestureDetector(
        onTap: callbackNavigation,
        child: Stack(
          children: [
            Image.asset(
              food.imageUrl,
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.035,
                  right: MediaQuery.of(context).size.width * 0.06,
                  bottom: MediaQuery.of(context).size.height * 0.01),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        food.name,
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .fontSize),
                      ),
                      Text(
                        '${food.price}',
                        style: TextStyle(
                            color: const Color(0xFFF4AA4A),
                            fontWeight: FontWeight.w700,
                            fontSize: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .fontSize),
                      )
                    ],
                  ),
                  const CustomItemIcon(
                    iconSize: 0.022,
                    imageAssetIcon: 'assets/images/carrito.png',
                    backgroundItemColor: Color(0xFFF4AA4A),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
