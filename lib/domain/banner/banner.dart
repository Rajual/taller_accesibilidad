class BannerModel {
  const BannerModel({required this.name, required this.urlPhoto});
  final String name;
  final String urlPhoto;

  factory BannerModel.fromJson(Map<String, dynamic> json) {
    return BannerModel(name: json['name'], urlPhoto: json['urlPhoto']);
  }
}
