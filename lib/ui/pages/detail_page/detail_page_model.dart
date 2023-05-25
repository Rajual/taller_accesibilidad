import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:taller_accesibilidad/domain/food/food.dart';
import 'package:taller_accesibilidad/ui/pages/detail_page/interfaces.dart';

class DetailPageModel implements Model {
  const DetailPageModel();

  @override
  Future<Food> getDetailFood(String foodName) async {
    final String foodResponse =
        await rootBundle.loadString('assets/json_backend/detail_bbq.json');

    final Map<String, dynamic> foodJson = await jsonDecode(foodResponse);

    final Food foodDetail = Food.fromJson(foodJson);

    return foodDetail;
  }
}
