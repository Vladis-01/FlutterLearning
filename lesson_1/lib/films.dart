import 'package:lesson_1/film.dart';

class Films {
  List<Film> filter(Film filerFilm, List<Film> allFilms){
    List<Film> helperList = List<Film>.from(allFilms);

    for(Film film in allFilms){
      if(filerFilm.title != "" && film.title != filerFilm.title){
        helperList.remove(film);
      }
      if(filerFilm.picture != "" && film.picture != filerFilm.picture){
        helperList.remove(film);
      }
      if(filerFilm.voteAverage != -1 && film.voteAverage != filerFilm.voteAverage){
        helperList.remove(film);
      }
      if(filerFilm.releaseDate != "" && film.releaseDate != filerFilm.releaseDate){
        helperList.remove(film);
      }
      if(filerFilm.language != "" && film.language != filerFilm.language){
        helperList.remove(film);
      }
    }
    return helperList;
  }

  Future getList(List<Film> list) async { // Не понял конкретно зачем возвращать список ассинхронно, возможно мне требуется более расширенное ТЗ
    final result = await List<Film>.from(list);
    return list;
  }
}