import 'dart:convert';

import 'package:flutter/services.dart';

class LocalStorage {
  Future<Map<String, dynamic>> getData(String path) async {
    final String foodResponse = await rootBundle.loadString(path);

    final Map<String, dynamic> foodJson = await jsonDecode(foodResponse);

    return foodJson;
  }
}
