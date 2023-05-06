import 'package:taller_accesibilidad/domain/food/food.dart';
import 'package:taller_accesibilidad/domain/food/food_gateway.dart';
import 'package:taller_accesibilidad/ui/pages/detail_page/interfacies.dart';

class DetailPageModel implements Model {
  const DetailPageModel({required this.foodGateway});
  final FoodGateway foodGateway;
  @override
  List<Food> getFoodsFavorite() {
    return foodGateway
        .getFood()
        .where((element) => element.favorite == true)
        .toList();
  }
}
