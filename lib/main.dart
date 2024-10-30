import 'package:flutter/material.dart';
import 'package:taller_accesibilidad/config/localizations.dart';
import 'package:taller_accesibilidad/domain/banner/usecase/banner_usecase.dart';
import 'package:taller_accesibilidad/domain/food/usecase/food_usecase.dart';
import 'package:taller_accesibilidad/infraestructure/repositories/banner/banner_local_repository.dart';
import 'package:taller_accesibilidad/infraestructure/repositories/food/food_local_repository.dart';
import 'package:taller_accesibilidad/infraestructure/services/local_storage.dart';
import 'package:taller_accesibilidad/ui/pages/home_page/home_page_view.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return InteractiveViewer(
      maxScale: 5,
      child: MaterialApp(
          localizationsDelegates: const [
            MyAppLocalizations.delegate,
          ],
          debugShowCheckedModeBanner: false,
          title: 'Taller Accesabilidad',
          home: HomePage(
            foodUsecase: FoodUsecase(
              foodGateway: FoodLocalRepository(LocalStorage()),
            ),
            bannerUsecase: BannerUsecase(
                bannerGateway: BannerRepositoryLocal(LocalStorage())),
          )),
    );
  }
}
