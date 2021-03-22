import 'package:movie_app_flutter/Modules/film_module.dart';
import 'package:movie_app_flutter/Modules/show_module.dart';

class Anime extends Show {
  Anime({
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
    int session,
    int episode,
    bool end = true,
    bool favorite = false,
  }) : super(
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
            favorite: favorite,
            session: session,
            episode: episode,
            end: end);
}
