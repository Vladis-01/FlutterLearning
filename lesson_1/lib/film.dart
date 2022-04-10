import 'dart:convert';

import 'package:lesson_1/abstractFilm.dart';

enum Language {
  russian,
  english,
  spanish
}

mixin ConvertStringToEnum {
  String _language = "";
  Language languageEnum = Language.english;
  void setLanguage(String language) {
    _language = language;

    switch(_language){

      case "Русский":
        languageEnum = Language.russian;
        break;
      case "Английский":
        languageEnum = Language.english;
        break;
      case "Испанский":
        languageEnum = Language.spanish;
        break;
    }
  }
}

class Film extends AbstractFilm with ConvertStringToEnum {
  Film({required String id, required String title, required String picture, required double voteAverage, required String releaseDate, required String description, required String language})
      : super(id, title, picture, voteAverage, releaseDate, description, language);

  @override
  String toString() {
    return title;
  }
}

extension Ext on Film{
  void toPrettyString(Language languageEnum) {
    String _language = "";

    Language _languageEnum = languageEnum;

    switch (_languageEnum) {
      case Language.russian:
        _language = "Русский";
        break;
      case Language.english:
        _language = "Английский";
        break;
      case Language.spanish:
        _language = "Испанский";
        break;
    }
  }
}