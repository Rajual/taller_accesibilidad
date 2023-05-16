import 'package:taller_accesibilidad/domain/banner/banner.dart';
import 'package:taller_accesibilidad/infraestructure/services/local_storage.dart';

import '../../../domain/banner/banner_gateway.dart';

class BannerRepositoryLocal implements BannerGateway {
  const BannerRepositoryLocal(this.localStorage);
  final LocalStorage localStorage;
  @override
  Future<List<Banner>> getBanners() async {
    final Map<String, dynamic> data = await localStorage.getData('banner');
    final List<Banner> result = [];
    data.forEach((key, value) {
      result.add(Banner(
        name: key,
        urlPhoto: key,
      ));
    });
    return result;
  }
}
