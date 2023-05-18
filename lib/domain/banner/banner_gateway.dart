import 'banner.dart';

abstract class BannerGateway {
  Future<List<BannerModel>> getBanners();
}
