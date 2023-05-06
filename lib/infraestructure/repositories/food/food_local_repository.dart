import 'package:taller_accesibilidad/domain/food/food.dart';
import 'package:taller_accesibilidad/domain/food/food_gateway.dart';
import 'package:taller_accesibilidad/infraestructure/services/local_storage.dart';

class FoodLocalRepository implements FoodGateway {
  const FoodLocalRepository(this.localStorage);
  final LocalStorage localStorage;
  @override
  List<Food> getFood() {
    final Map<String, dynamic> data = localStorage.getData();
    final List<Food> result = [];
    data.forEach((key, value) {
      result.add(Food(name: key, favorite: value is bool));
    });
    return result;
  }
}
