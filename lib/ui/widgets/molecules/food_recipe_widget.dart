import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';

import '../../../domain/food/food.dart';
import '../../models/locale_model.dart';
import '../atoms/label_widget.dart';

class FoodRecipeWidget extends StatelessWidget {
  const FoodRecipeWidget({
    super.key,
    required this.description,
    required this.ingredients,
    required this.food,
    this.semanticOrdinal,
  });

  final ItemModel? description;
  final ItemModel? ingredients;
  final Food? food;
  final double? semanticOrdinal;

  @override
  Widget build(BuildContext context) {
    return InteractiveViewer(
      maxScale: 5,
      child: Semantics(
        sortKey: OrdinalSortKey(semanticOrdinal ?? double.maxFinite),
        focusable: true,
        child: Container(
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
              Semantics(
                sortKey: const OrdinalSortKey(2),
                child: Column(
                  children: [
                    LabelWidget(
                      item: description,
                      style: const TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 17,
                          letterSpacing: -0.67),
                    ),
                    LabelWidget(
                      item: ItemModel(
                        label: food?.description ?? '',
                      ),
                      style: const TextStyle(
                        fontSize: 13,
                        letterSpacing: -0.67,
                        color: Color(0xFFB6B6B6),
                      ),
                    ),
                  ],
                ),
              ),

              ///
              Semantics(
                sortKey: const OrdinalSortKey(1),
                child: MergeSemantics(
                  child: Column(
                    children: [
                      LabelWidget(
                        item: ingredients,
                        style: const TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 17,
                            letterSpacing: -0.67),
                      ),
                      SizedBox(
                        height: 170.0,
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: food?.ingredients?.length ?? 0,
                          itemBuilder: (BuildContext context, int index) {
                            final Ingredients? ingredients =
                                food?.ingredients?[index];
                            return Row(children: [
                              Container(
                                margin: const EdgeInsets.all(3),
                                padding: const EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  color: const Color(0xFFEA4F46),
                                  borderRadius: BorderRadius.circular(50),
                                ),
                              ),
                              LabelWidget(
                                item: ItemModel(
                                  label:
                                      '${ingredients?.quantity ?? ''} ${ingredients?.unitMeasure ?? ''} ${ingredients?.name ?? ''}',
                                ),
                                style: const TextStyle(
                                    color: Color(0xFFB6B6B6),
                                    letterSpacing: -0.67),
                              ),
                            ]);
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
