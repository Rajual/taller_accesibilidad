import 'package:taller_accesibilidad/domain/food/food.dart';
import 'package:taller_accesibilidad/domain/food/food_gateway.dart';
import 'package:taller_accesibilidad/ui/pages/detail_page/interfaces.dart';

class DetailPageModel implements Model {
  const DetailPageModel({required this.foodGateway});
  final FoodGateway foodGateway;

  @override
  Future<Food> getDetailFood(String foodName) async {
    final Food foodDetail = await foodGateway.getDetailFood();

    return foodDetail;
  }
}
