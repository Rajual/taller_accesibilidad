import 'package:taller_accesibilidad/domain/food/food.dart';
import 'package:taller_accesibilidad/domain/food/food_gateway.dart';
import 'package:taller_accesibilidad/infraestructure/services/local_storage.dart';

class FoodLocalRepository implements FoodGateway {
  const FoodLocalRepository(this.localStorage);
  final LocalStorage localStorage;
  @override
  Future<List<Food>> getFood() async {
    final List<Food> foods = [];
    final Map<String, dynamic> data =
        await localStorage.getData('assets/foods.json');
    data.forEach((key, value) {
      foods.add(Food.fromJson(value));
    });
    return foods;
  }
}
