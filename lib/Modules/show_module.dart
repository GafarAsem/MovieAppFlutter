import 'package:movie_app_flutter/Modules/film_module.dart';

class Show extends Film {
  final int session, episode;
  bool end;

  Show({
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
    this.session,
    this.episode,
    this.end = true,
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
            typeFilm: TypeFilm.TvShow,
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