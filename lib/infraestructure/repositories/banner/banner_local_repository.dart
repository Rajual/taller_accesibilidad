import 'package:taller_accesibilidad/domain/banner/banner.dart';
import 'package:taller_accesibilidad/infraestructure/services/local_storage.dart';

import '../../../domain/banner/banner_gateway.dart';

class BannerRepositoryLocal implements BannerGateway {
  const BannerRepositoryLocal(this.localStorage);
  final LocalStorage localStorage;
  @override
  Future<List<BannerModel>> getBanners() async {
    final List<BannerModel> banners = [];
    final Map<String, dynamic> data =
        await localStorage.getData('assets/banner.json');

    for (var element in data['banners']) {
      banners.add(BannerModel.fromJson(element));
    }
    return banners;
  }
}
