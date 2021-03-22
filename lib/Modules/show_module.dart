import 'package:flutter/cupertino.dart';
import 'package:movie_app_flutter/Modules/film_module.dart';

class Show extends Film {
  final int session, episode;
  bool end;

  Show({
    @required String title,
    @required String story,
    @required String language,
    @required String country,
    @required String hourWatch,
    @required String director,
    @required String date,
    @required String postURL,
    @required double rating,
    @required List<String> sortFilm,
    @required this.session,
    @required this.episode,
    this.end = true,
    TypeFilm typeFilm = TypeFilm.TvShow,
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
            typeFilm: typeFilm,
            favorite: favorite);

  int get getSession {
    return session;
  }

  int get getEpisodeNumper {
    return episode;
  }

  bool get isEnd {
    return end;
  }
}
