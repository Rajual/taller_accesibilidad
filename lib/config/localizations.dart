import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:taller_accesibilidad/ui/models/locale_model.dart';

class MyAppLocalizations {
  final Locale locale;

  MyAppLocalizations(this.locale);

  // Helper method to keep the code in the widgets concise
  // Localizations are accessed using an InheritedWidget "of" syntax
  static MyAppLocalizations? of(BuildContext context) {
    return Localizations.of<MyAppLocalizations>(context, MyAppLocalizations);
  }

  // Static member to have a simple access to the delegate from the MaterialApp
  static const LocalizationsDelegate<MyAppLocalizations> delegate =
      MyAppLocalizationsDelegate();

  Map<String, dynamic>? _localizedStrings;

  Future<bool> load() async {
    // Load the language JSON file from the "lang" folder
    String jsonString =
        await rootBundle.loadString('assets/locale/${'es'}/page.json');
    Map<String, dynamic> jsonMap = json.decode(jsonString);

    _localizedStrings = jsonMap.map((key, value) {
      return MapEntry(key, value);
    });

    return true;
  }

  // This method will be called from every widget which needs a localized text
  String? translate(String key) {
    return _localizedStrings![key];
  }

  LocaleModel getJsonTranslate() {
    return LocaleModel.fromMap(_localizedStrings ?? {});
  }
}

class MyAppLocalizationsDelegate
    extends LocalizationsDelegate<MyAppLocalizations> {
  // This delegate instance will never change (it doesn't even have fields!)
  // It can provide a constant constructor.
  const MyAppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    // Include all of your supported language codes here
    return ['en', 'es'].contains(locale.languageCode);
  }

  @override
  Future<MyAppLocalizations> load(Locale locale) async {
    // AppLocalizations class is where the JSON loading actually runs
    MyAppLocalizations localizations = MyAppLocalizations(locale);
    await localizations.load();
    return localizations;
  }

  @override
  bool shouldReload(MyAppLocalizationsDelegate old) => false;
}
