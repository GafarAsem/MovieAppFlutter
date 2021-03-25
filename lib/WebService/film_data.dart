import 'package:intl/intl.dart';
import 'package:movie_app_flutter/Modules/movie_module.dart';

enum TypeMovie { trending, discovering, details }

class FilmData {
  static var dateFormat = DateFormat('yyyy-mm-dd');
//datetime parse not work
  static List<Movie> getMovies(Map responeResult, TypeMovie typeMovie) {
    List<Movie> movies = [];

    switch (typeMovie) {
      case TypeMovie.trending:
        for (int i = 0; i < responeResult['results'].length; i++) {
          var movieDetaile = responeResult['results'][i];
          movies.add(Movie(
              id: movieDetaile['id'],
              title: movieDetaile['title'],
              story: movieDetaile['overview'],
              language: movieDetaile['original_language'],
              country: null,
              hourWatch: null,
              director: null,
              date: DateTime.tryParse(movieDetaile['release_date']),
              postURL: movieDetaile['poster_path'],
              rating: movieDetaile['vote_average'],
              sortFilm: movieDetaile['genre_ids']));
        }
        break;
      case TypeMovie.discovering:
        for (int i = 0; i < responeResult['results'].length; i++) {
          var movieDetaile = responeResult['results'][i];
          movies.add(Movie(
              id: movieDetaile['id'],
              title: movieDetaile['title'],
              story: movieDetaile['overview'],
              language: movieDetaile['original_language'],
              country: null,
              hourWatch: null,
              director: null,
              date: DateTime.tryParse(movieDetaile['release_date']),
              postURL: movieDetaile['poster_path'],
              rating: movieDetaile['vote_average'].runtimeType==int?movieDetaile['vote_average'].toDouble(): movieDetaile['vote_average'],
              sortFilm: movieDetaile['genre_ids']));
        }
        break;

      case TypeMovie.details:
        List ss = [];
        movies.add(Movie(
            id: responeResult['id'],
            title: responeResult['title'],
            story: responeResult['overview'],
            language: responeResult['original_language'],
            country: responeResult['production_countries'][0]['iso_3166_1'],
            hourWatch: responeResult['runtime'].toString(),
            director: null,
            date: DateTime.tryParse(responeResult['release_date']),
            postURL: responeResult['responeResult'],
            rating: responeResult['vote_average'],
            sortFilm: responeResult['genres']
                .map((e) => e['name'].toString())
                .toList()));
        break;
    }

    return movies;
  }
}
