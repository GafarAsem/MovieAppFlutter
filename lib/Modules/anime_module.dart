import 'package:flutter/cupertino.dart';
import 'package:movie_app_flutter/Modules/film_module.dart';
import 'package:movie_app_flutter/Modules/show_module.dart';

class Anime extends Show {
  Anime({
    @required int id,
    @required String title,
    @required String story,
    @required String language,
    @required String country,
    @required String hourWatch,
    @required String director,
    @required DateTime date,
    @required String postURL,
    @required double rating,
    @required List<dynamic> sortFilm,
    @required int session,
    @required int episode,
    bool end = true,
    bool favorite = false,
  }) : super(
    id:id,
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
          typeFilm: TypeFilm.Anime,
          end: end,
        );












}
