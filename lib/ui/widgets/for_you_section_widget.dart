import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';

import '../../domain/food/food.dart';
import '../models/locale_model.dart';
import 'food_for_you_widget.dart';
import 'label_widget.dart';

class ForYouSectionWidget extends StatelessWidget {
  final ItemModel forYou;
  final ItemModel seeMore;
  final Future<List<Food>> foods;
  final void Function(String)? action;
  const ForYouSectionWidget(
      {super.key,
      required this.forYou,
      required this.seeMore,
      required this.foods,
      this.action});

  @override
  Widget build(BuildContext context) {
    return Semantics(
      sortKey: OrdinalSortKey(forYou.semanticOrdinal),
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
