import 'package:movie_app_flutter/Modules/film_module.dart';

class Movie extends Film {
  Movie({
      String title,
      String story,
      String language,
      String country,
      String hourWatch,
      String director,
      String date,
      String postURL,
      double rating,
      List<String> sortFilm,
      typeFilm,
      bool favorite=false})
      : super(
            title: title,
            story: story,
            language: language,
            country: country,
            hourWatch: hourWatch,
            director: director,
            date: date,
            postURL: postURL,
            rating: rating,
            sortFilm: sortFilm,
            typeFilm: typeFilm,
            favorite: favorite);
}
