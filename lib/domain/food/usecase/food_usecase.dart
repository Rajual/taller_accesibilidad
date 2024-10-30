import '../food.dart';
import '../food_gateway.dart';

class FoodUsecase {
  FoodUsecase({
    required this.foodGateway,
  });
  final FoodGateway foodGateway;

  Future<List<Food>> get foods => foodGateway.getFood();

  Future<Food> getDetailFood(String foodName) async {
    final Food foodDetail = await foodGateway.getDetailFood();

    return foodDetail;
  }
}
