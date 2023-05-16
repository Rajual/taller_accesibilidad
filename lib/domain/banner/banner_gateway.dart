import 'banner.dart';

abstract class BannerGateway {
  Future<List<Banner>> getBanners();
}
