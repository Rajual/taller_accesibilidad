import 'package:flutter/material.dart';

import '../models/locale_model.dart';
import '../pages/home_page/interfaces.dart';

class SearchFoodFoodWidget extends StatelessWidget {
  const SearchFoodFoodWidget({
    super.key,
    required this.search,
    required this.model,
  });

  final ItemModel? search;
  final ModelInterface? model;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: const Color(0xFFF9F9F9)),
      child: TextField(
        controller: model!.searchTextEditingController,
        decoration: InputDecoration(
          border: InputBorder.none,
          prefixIcon: const Icon(Icons.search),
          prefixIconColor: const Color(0xFFF4AA4A),
          hintText: search?.label,
          hintStyle: const TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}
