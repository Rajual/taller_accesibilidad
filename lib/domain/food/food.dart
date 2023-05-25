class Food {
  const Food({
    required this.name,
    required this.imageUrl,
    this.time,
    this.quantity,
    this.calories,
    this.description,
    this.price,
    this.ingredients,
    this.favorite = false,
  });
  final String name;
  final String imageUrl;
  final String? time;
  final String? quantity;
  final String? calories;
  final String? description;
  final String? price;
  final List<Ingredients>? ingredients;
  final bool favorite;

  factory Food.fromJson(Map<String, dynamic> jsonFood) {
    return Food(
      name: jsonFood['name'],
      imageUrl: jsonFood['image'],
      time: jsonFood['time'],
      quantity: jsonFood['quantity'],
      calories: jsonFood['calories'],
      description: jsonFood['description'],
      price: jsonFood['price'],
      ingredients:
          Ingredients.fromListJson(List.from(jsonFood['ingredients'] ?? [])),
    );
  }
}

class Ingredients {
  const Ingredients(
      {required this.name, required this.unitMeasure, required this.quantity});
  final String name;
  final String unitMeasure;
  final String quantity;

  static List<Ingredients> fromListJson(
      List<Map<String, dynamic>> ingredientsJson) {
    List<Ingredients> ingredientsPerPlate = [];
    for (var ingredient in ingredientsJson) {
      ingredientsPerPlate.add(Ingredients.fromJson(ingredient));
    }
    return ingredientsPerPlate;
  }

  factory Ingredients.fromJson(Map<String, dynamic> ingredient) {
    return Ingredients(
        name: ingredient['ingredient_name'],
        unitMeasure: ingredient['unit_measure'],
        quantity: ingredient['quantity']);
  }
}
