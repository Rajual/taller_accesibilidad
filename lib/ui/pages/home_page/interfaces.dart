import 'package:flutter/material.dart';

abstract class View {
  void goToDetailsPage(BuildContext context, String foodDetailName);
}

abstract class Presenter {}

abstract class Model {}
