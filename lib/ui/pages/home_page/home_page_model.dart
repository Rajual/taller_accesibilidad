import 'package:taller_accesibilidad/domain/food/food.dart';
import 'package:taller_accesibilidad/ui/pages/home_page/interfaces.dart';

import '../../../domain/food/food_gateway.dart';

class HomePageModel implements Model {
  HomePageModel({required this.foodGateway});
  final FoodGateway foodGateway;

  @override
  Future<List<Food>> get foods => foodGateway.getFood();
}
