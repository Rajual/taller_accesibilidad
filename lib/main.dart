import 'package:flutter/material.dart';
import 'package:taller_accesibilidad/config/localizations.dart';
import 'package:taller_accesibilidad/infraestructure/repositories/banner/banner_local_repository.dart';
import 'package:taller_accesibilidad/infraestructure/repositories/food/food_local_repository.dart';
import 'package:taller_accesibilidad/infraestructure/services/local_storage.dart';
import 'package:taller_accesibilidad/ui/pages/home_page/home_page_model.dart';
import 'package:taller_accesibilidad/ui/pages/home_page/home_page_view.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        localizationsDelegates: const [
          MyAppLocalizations.delegate,
        ],
        debugShowCheckedModeBanner: false,
        title: 'Taller Accesabilidad',
        home: HomePage(
          searchTextEditingController: TextEditingController(),
          model: HomePageModel(
              foodGateway: FoodLocalRepository(LocalStorage()),
              bannerGateway: BannerRepositoryLocal(LocalStorage())),
        ));
  }
}
