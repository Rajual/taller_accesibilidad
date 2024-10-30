import 'package:flutter/material.dart';

import '../../../domain/food/food.dart';
import 'food_grid_widget.dart';

class FoodForYouWidget extends StatelessWidget {
  const FoodForYouWidget({required this.foods, this.action, super.key});

  final Future<List<Food>> foods;
  final void Function(String label)? action;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Food>>(
      future: foods,
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
              mainAxisSpacing: MediaQuery.of(context).size.height * 0.02),
          itemBuilder: (context, index) {
            return FoodGridWidget(
              callbackNavigation: () =>
                  action?.call(snapshot.data![index].name),
              food: snapshot.data![index],
            );
          },
        );
      },
    );
  }
}
