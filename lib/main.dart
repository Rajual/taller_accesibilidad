import 'package:flutter/material.dart';
import 'package:taller_accesibilidad/ui/pages/home_page.dart/home_page_view.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Taller Accesabilidad',
        home: HomePage(
          searchTextEditingController: TextEditingController(),
          bannerImages: const [
            'assets/images/burger.png',
            'assets/images/cake.png',
            'assets/images/cookies.png'
          ],
          foodForUser: const [
            {
              'name': 'Spicy Wings',
              'price': '\$24.00',
              'urlPhoto': 'assets/images/spicy_wings.png'
            },
            {
              'name': 'BBQ Ribs',
              'price': '\$24.00',
              'urlPhoto': 'assets/images/bbq_ribs.png'
            },
            {
              'name': 'Curries',
              'price': '\$24.00',
              'urlPhoto': 'assets/images/curry.png'
            },
            {
              'name': 'Salads',
              'price': '\$24.00',
              'urlPhoto': 'assets/images/salad_main.png'
            },
          ],
        ));
  }
}
