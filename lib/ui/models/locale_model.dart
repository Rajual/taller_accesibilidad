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
  final String title;
  final String subTitle;

  factory HomeModel.fromMap(Map<String, dynamic> json) {
    return HomeModel(
      title: json['title'] ?? '',
      subTitle: json['sub_title'] ?? '',
    );
  }
}
