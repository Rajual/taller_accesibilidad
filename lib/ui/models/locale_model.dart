class LocaleModel {
  const LocaleModel({required this.homeModel});
  final HomeModel homeModel;

  factory LocaleModel.fromMap(Map<String, dynamic> json) {
    return LocaleModel(
      homeModel: HomeModel.fromMap(
        json['home'],
      ),
    );
  }
}

class HomeModel {
  const HomeModel({required this.title, required this.subTitle});
  final ItemModel title;
  final ItemModel subTitle;

  factory HomeModel.fromMap(Map<String, dynamic> json) {
    return HomeModel(
      title: ItemModel.formMap(json['title'] ?? ''),
      subTitle: ItemModel.formMap(json['sub_title'] ?? ''),
    );
  }
}

class ItemModel {
  ItemModel({required this.label, required this.semantic});
  final String label;
  final String semantic;

  factory ItemModel.formMap(Map<String, dynamic> json) {
    return ItemModel(label: json['label'], semantic: json['semantic']);
  }
}
