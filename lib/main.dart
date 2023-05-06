import 'package:flutter/material.dart';
import 'package:taller_accesibilidad/infraestructure/repositories/food/food_local_repository.dart';
import 'package:taller_accesibilidad/infraestructure/services/local_storage.dart';
import 'package:taller_accesibilidad/ui/pages/detail_page/detail_page_model.dart';
import 'package:taller_accesibilidad/ui/pages/detail_page/detail_page_view.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Material App Bar'),
        ),
        body: DetailPageView(
            model: DetailPageModel(
                foodGateway: FoodLocalRepository(LocalStorage()))),
      ),
    );
  }
}
