import 'package:taller_accesibilidad/domain/banner/banner.dart';
import 'package:taller_accesibilidad/infraestructure/services/local_storage.dart';

import '../../../domain/banner/banner_gateway.dart';

class BannerRepositoryLocal implements BannerGateway {
  const BannerRepositoryLocal(this.localStorage);
  final LocalStorage localStorage;
  @override
  List<Banner> getBanners() {
    final Map<String, dynamic> data = localStorage.getData();
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
