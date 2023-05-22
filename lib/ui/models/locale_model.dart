class LocaleModel {
  const LocaleModel({required this.homeModel, required this.detailModel});
  final HomeModel homeModel;
  final DetailModel detailModel;

  factory LocaleModel.fromMap(Map<String, dynamic> json) {
    return LocaleModel(
      homeModel: HomeModel.fromMap(
        json['home'],
      ),
      detailModel: DetailModel.fromJson(json['details']),
    );
  }
}

class HomeModel {
  const HomeModel({
    required this.title,
    required this.subTitle,
    required this.categorySubtitle,
    required this.forYou,
    required this.seeMore,
    required this.search,
  });
  final ItemModel title;
  final ItemModel subTitle;
  final ItemModel categorySubtitle;
  final ItemModel forYou;
  final ItemModel seeMore;
  final ItemModel search;

  factory HomeModel.fromMap(Map<String, dynamic> json) {
    return HomeModel(
      title: ItemModel.fromMap(json['title'] ?? ''),
      subTitle: ItemModel.fromMap(json['sub_title'] ?? ''),
      categorySubtitle: ItemModel.fromMap(json['category_subtitle'] ?? ''),
      forYou: ItemModel.fromMap(json['for_you'] ?? ''),
      seeMore: ItemModel.fromMap(json['see_more'] ?? ''),
      search: ItemModel.fromMap(json['search'] ?? ''),
    );
  }
}

class ItemModel {
  ItemModel({required this.label, required this.semantic});
  final String label;
  final String semantic;

  factory ItemModel.fromMap(Map<String, dynamic> json) {
    return ItemModel(label: json['label'], semantic: json['semantic']);
  }
}

class DetailModel {
  final ItemModel subTitle;
  final ItemModel description;
  final ItemModel ingredients;
  final IconsDetails iconsDetails;

  DetailModel({
    required this.subTitle,
    required this.description,
    required this.ingredients,
    required this.iconsDetails,
  });

  factory DetailModel.fromJson(Map<String, dynamic> json) => DetailModel(
        subTitle: ItemModel.fromMap(json["sub_title"]),
        description: ItemModel.fromMap(json["description"]),
        ingredients: ItemModel.fromMap(json["ingredients"]),
        iconsDetails: IconsDetails.fromMap(json["icons"]),
      );
}

class IconsDetails {
  final IconModel? time;
  final IconModel? quantity;
  final IconModel? calories;
  IconsDetails({this.time, this.quantity, this.calories});

  factory IconsDetails.fromMap(Map<String, dynamic> json) => IconsDetails(
        calories: IconModel.fromJson(json["calories"]),
        quantity: IconModel.fromJson(json["quantity"]),
        time: IconModel.fromJson(json["time"]),
      );
}

class IconModel {
  final String urlImage;
  final String semantic;

  IconModel({
    required this.urlImage,
    required this.semantic,
  });

  factory IconModel.fromJson(Map<String, dynamic> json) => IconModel(
        urlImage: json["url_image"],
        semantic: json["semantic"],
      );
}
