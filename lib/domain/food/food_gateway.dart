import 'package:taller_accesibilidad/domain/food/food.dart';

abstract class FoodGateway {
  Future<List<Food>> getFood();
}
