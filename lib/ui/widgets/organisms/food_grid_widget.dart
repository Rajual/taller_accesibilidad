import 'package:flutter/material.dart';

import '../../../domain/food/food.dart';
import '../atoms/custom_item_icon.dart';

class FoodGridWidget extends StatelessWidget {
  const FoodGridWidget(
      {super.key, required this.food, required this.callbackNavigation});
  final Food food;
  final VoidCallback? callbackNavigation;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: '${food.name} ${food.price}',
      focusable: true,
      child: GestureDetector(
        onTap: callbackNavigation,
        child: ExcludeSemantics(
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
                      iconSize: 0.01,
                      imageAssetIcon: 'assets/images/carrito.png',
                      backgroundItemColor: Color(0xFFF4AA4A),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
