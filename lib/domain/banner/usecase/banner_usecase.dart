import 'package:flutter/widgets.dart';

import '../banner.dart';
import '../banner_gateway.dart';

class BannerUsecase {
  BannerUsecase({required this.bannerGateway});

  final BannerGateway bannerGateway;

  final TextEditingController searchTextEditingController =
      TextEditingController();

  Future<List<BannerModel>> get banners => bannerGateway.getBanners();
}
