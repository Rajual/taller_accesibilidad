import 'package:flutter/widgets.dart';

abstract class HomePageInterface {
  void goToDetailsPage(BuildContext context, String foodDetailName);
  void getBanners(BuildContext context);
}
