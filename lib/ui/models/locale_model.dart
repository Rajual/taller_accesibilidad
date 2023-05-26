class LocaleModel {
  const LocaleModel({required this.homeModel, required this.detailModel});
  final HomeUiModel homeModel;
  final DetailUiModel detailModel;

  factory LocaleModel.fromMap(Map<String, dynamic> json) {
    return LocaleModel(
      homeModel: HomeUiModel.fromMap(
        json['home'],
      ),
      detailModel: DetailUiModel.fromJson(json['details']),
    );
  }
}

class HomeUiModel {
  const HomeUiModel({
    required this.title,
    required this.subTitle,
    required this.banner,
    required this.categorySubtitle,
    required this.forYou,
    required this.seeMore,
    required this.search,
  });
  final ItemModel title;
  final ItemModel subTitle;
  final ItemModel banner;
  final ItemModel categorySubtitle;
  final ItemModel forYou;
  final ItemModel seeMore;
  final ItemModel search;

  factory HomeUiModel.fromMap(Map<String, dynamic> json) {
    return HomeUiModel(
        title: ItemModel.fromMap(json['title'] ?? ''),
        subTitle: ItemModel.fromMap(json['sub_title'] ?? ''),
        categorySubtitle: ItemModel.fromMap(json['category_subtitle'] ?? ''),
        forYou: ItemModel.fromMap(json['for_you'] ?? ''),
        seeMore: ItemModel.fromMap(json['see_more'] ?? ''),
        search: ItemModel.fromMap(json['search'] ?? ''),
        banner: ItemModel.fromMap(json['banner'] ?? ''));
  }
}

class ItemModel {
  const ItemModel({
    required this.label,
    this.semantic,
    this.semanticOrdinal = double.maxFinite,
  });
  final String label;
  final String? semantic;
  final double semanticOrdinal;

  factory ItemModel.fromMap(Map<String, dynamic> json) {
    final auxLabel = json['label'] ?? '';
    return ItemModel(
      label: auxLabel,
      semantic: json['semantic'] ?? auxLabel,
      semanticOrdinal: json["semanticOrdinal"] ?? double.maxFinite,
    );
  }
}

class DetailUiModel {
  final ItemModel subTitle;
  final ItemModel description;
  final ItemModel ingredients;
  final IconsDetails iconsDetails;

  DetailUiModel({
    required this.subTitle,
    required this.description,
    required this.ingredients,
    required this.iconsDetails,
  });

  factory DetailUiModel.fromJson(Map<String, dynamic> json) => DetailUiModel(
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
  final double? semanticOrdinal;

  IconsDetails({
    this.time,
    this.quantity,
    this.calories,
    this.semanticOrdinal,
  });

  factory IconsDetails.fromMap(Map<String, dynamic> json) => IconsDetails(
      calories: IconModel.fromJson(json["calories"]),
      quantity: IconModel.fromJson(json["quantity"]),
      time: IconModel.fromJson(json["time"]),
      semanticOrdinal: json["semanticOrdinal"]);
}

class IconModel {
  final String? urlImage;
  final String semantic;
  final double semanticOrdinal;

  IconModel({
    required this.urlImage,
    required this.semantic,
    this.semanticOrdinal = double.maxFinite,
  });

  factory IconModel.fromJson(Map<String, dynamic> json) {
    return IconModel(
      urlImage: json["url_image"],
      semantic: json["semantic"] ?? '',
      semanticOrdinal: json["semanticOrdinal"] ?? double.maxFinite,
    );
  }
}
