import 'package:flutter/material.dart';
import 'package:taller_accesibilidad/ui/pages/home_page.dart/interfaces.dart';

class HomePage extends StatefulWidget implements View {
  final TextEditingController searchTextEditingController;
  final List<String> bannerImages;
  final List<Map<String, dynamic>> foodForUser;

  const HomePage(
      {super.key,
      required this.searchTextEditingController,
      required this.bannerImages,
      required this.foodForUser});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int activePage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
            padding: EdgeInsets.symmetric(
                vertical: MediaQuery.of(context).size.height * 0.1,
                horizontal: MediaQuery.of(context).size.width * 0.05),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Chef Burger',
                  style: TextStyle(fontWeight: FontWeight.w700, height: 2.5),
                ),
                const Text("Let's grab your food!"),
                SizedBox(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.2,
                  child: Stack(
                    children: [
                      PageView.builder(
                        itemCount: widget.bannerImages.length,
                        pageSnapping: true,
                        onPageChanged: (value) {
                          setState(() {
                            activePage = value;
                          });
                        },
                        itemBuilder: (context, index) {
                          return Container(
                            margin: EdgeInsets.symmetric(
                                horizontal:
                                    MediaQuery.of(context).size.width * 0.01),
                            child: Image.asset(widget.bannerImages[index]),
                          );
                        },
                      ),
                      Positioned(
                        bottom: MediaQuery.of(context).size.height * 0.02,
                        left: MediaQuery.of(context).size.width * 0.39,
                        child: Row(
                          children: indicators(
                              widget.bannerImages.length, activePage),
                        ),
                      ),
                    ],
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
                //TODO: refactor to consume data from the json
                const FoodCategoryRowWidget(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      'Food for you',
                      style:
                          TextStyle(fontWeight: FontWeight.w700, height: 2.5),
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
                  child: GridView.builder(
                    itemCount: widget.foodForUser.length,
                    padding: EdgeInsets.symmetric(
                        vertical: MediaQuery.of(context).size.height * 0.02),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing:
                            MediaQuery.of(context).size.height * 0.02),
                    itemBuilder: (context, index) {
                      return Stack(
                        children: [
                          Image.asset(
                            widget.foodForUser[index]['urlPhoto'],
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                left: MediaQuery.of(context).size.width * 0.035,
                                right: MediaQuery.of(context).size.width * 0.06,
                                bottom:
                                    MediaQuery.of(context).size.height * 0.01),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '${widget.foodForUser[index]['name']}',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize: Theme.of(context)
                                              .textTheme
                                              .titleSmall!
                                              .fontSize),
                                    ),
                                    Text(
                                      '${widget.foodForUser[index]['price']}',
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
                      );
                    },
                  ),
                )
              ],
            )),
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
}

class FoodCategoryRowWidget extends StatelessWidget {
  const FoodCategoryRowWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: const [
            CustomItemIcon(
              imageAssetIcon: 'assets/images/main.png',
              iconSize: 0.05,
            ),
            Text('Main'),
          ],
        ),
        Column(
          children: const [
            CustomItemIcon(
              imageAssetIcon: 'assets/images/salad.png',
              iconSize: 0.05,
            ),
            Text('Salad'),
          ],
        ),
        Column(
          children: const [
            CustomItemIcon(
              imageAssetIcon: 'assets/images/appetizer.png',
              iconSize: 0.05,
            ),
            Text('Appetizer'),
          ],
        ),
        Column(
          children: const [
            CustomItemIcon(
              imageAssetIcon: 'assets/images/drinks.png',
              iconSize: 0.05,
            ),
            Text('Drinks'),
          ],
        ),
        Column(
          children: const [
            CustomItemIcon(
              imageAssetIcon: 'assets/images/dessert.png',
              iconSize: 0.05,
            ),
            Text('Dessert'),
          ],
        )
      ],
    );
  }
}

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        backgroundColor: Colors.white,
        elevation: 15.0,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        iconSize: 3.0,
        items: const [
          BottomNavigationBarItem(
            label: 'Home',
            icon: CustomItemIcon(
              iconSize: 0.025,
              imageAssetIcon: 'assets/images/home.png',
              backgroundItemColor: Color(0xFFF9F9F9),
            ),
          ),
          BottomNavigationBarItem(
            label: 'Ticket',
            icon: CustomItemIcon(
              iconSize: 0.025,
              imageAssetIcon: 'assets/images/ticket.png',
              backgroundItemColor: Color(0xFFF9F9F9),
            ),
          ),
          BottomNavigationBarItem(
            label: 'Carrito',
            icon: CustomItemIcon(
              iconSize: 0.035,
              imageAssetIcon: 'assets/images/carrito.png',
              backgroundItemColor: Color(0xFFF4AA4A),
            ),
          ),
          BottomNavigationBarItem(
            label: 'Favoritos',
            icon: CustomItemIcon(
              iconSize: 0.033,
              imageAssetIcon: 'assets/images/favorites.png',
              backgroundItemColor: Color(0xFFF9F9F9),
            ),
          ),
          BottomNavigationBarItem(
            label: 'Settings',
            icon: CustomItemIcon(
              iconSize: 0.03,
              imageAssetIcon: 'assets/images/setting.png',
              backgroundItemColor: Color(0xFFF9F9F9),
            ),
          ),
        ]);
  }
}

class CustomItemIcon extends StatelessWidget {
  final String imageAssetIcon;
  final double iconSize;
  final Color? backgroundItemColor;
  const CustomItemIcon({
    super.key,
    required this.imageAssetIcon,
    required this.iconSize,
    this.backgroundItemColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(9.0),
      decoration: BoxDecoration(
          color: backgroundItemColor ?? const Color.fromARGB(0, 255, 255, 255),
          borderRadius: BorderRadius.circular(30)),
      child: Image.asset(
        imageAssetIcon,
        height: MediaQuery.of(context).size.height * iconSize,
      ),
    );
  }
}
