import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../../config/localizations.dart';
import '../pages/home_page/home_page_view.dart';

class SearchFoodFoodWidget extends StatelessWidget {
  const SearchFoodFoodWidget({
    super.key,
    required this.widget,
  });

  final HomePage widget;

  @override
  Widget build(BuildContext context) {
    final search =
        MyAppLocalizations.of(context)?.getJsonTranslate().homeModel.search;
    return Semantics(
      label: search?.semantic ?? search?.label,
      sortKey: OrdinalSortKey(search?.semanticOrdinal ?? double.maxFinite),
      focused: true,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: const Color(0xFFF9F9F9)),
        child: TextField(
          controller: widget.model.searchTextEditingController,
          decoration: InputDecoration(
            border: InputBorder.none,
            prefixIcon: const Icon(Icons.search),
            prefixIconColor: const Color(0xFFF4AA4A),
            hintText: search?.label,
            hintStyle: const TextStyle(color: Colors.black),
          ),
        ),
      ),
    );
  }
}
