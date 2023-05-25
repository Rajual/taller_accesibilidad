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
        await localStorage.getData('assets/json_backend/foods.json');

    for (var element in data['foods']) {
      foods.add(Food.fromJson(element));
    }
    return foods;
  }

  @override
  Future<Food> getDetailFood() async {
    final Map<String, dynamic> foodJson =
        await localStorage.getData('assets/json_backend/detail_bbq.json');
    final Food foodDetail = Food.fromJson(foodJson);

    return foodDetail;
  }
}
