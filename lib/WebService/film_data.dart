import 'package:intl/intl.dart';
import 'package:movie_app_flutter/Modules/movie_module.dart';
import 'package:movie_app_flutter/Modules/show_module.dart';

enum TypeMovie { trending, discovering, details, list }
enum TypeShow { trending, discovering, details, list }

class FilmData {
  static var dateFormat = DateFormat('yyyy-mm-dd');

//datetime parse not work
  static List<Movie> getMovies(dynamic responeResult, TypeMovie typeMovie) {
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
              rating: movieDetaile['vote_average'].runtimeType == int
                  ? movieDetaile['vote_average'].toDouble()
                  : movieDetaile['vote_average'],
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
              rating: movieDetaile['vote_average'].runtimeType == int
                  ? movieDetaile['vote_average'].toDouble()
                  : movieDetaile['vote_average'],
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
      case TypeMovie.list:
        for (int i = 0; i < responeResult.length; i++) {
          var movieDetaile = responeResult[i];
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
              rating: movieDetaile['vote_average'].runtimeType == int
                  ? movieDetaile['vote_average'].toDouble()
                  : movieDetaile['vote_average'],
              sortFilm: movieDetaile['genre_ids']));
        }
        break;
    }

    return movies;
  }

  static List<Show> getShows(dynamic responeResult, TypeShow typeShow) {
    List<Show> shows = [];
    switch (typeShow) {
      case TypeShow.trending:
        responeResult['results'].forEach((element) => shows.add(Show(
            id: element['id'] as int,
            title: element['name'],
            story: element['overview'],
            language: element['original_language'],
            country: element['origin_country'].length != 0
                ? element['origin_country'][0]
                : " ",
            hourWatch: null,
            director: null,
            date: DateTime.tryParse(element['first_air_date']),
            postURL: element['poster_path'],
            rating: element['vote_average'].runtimeType == int
                ? element['vote_average'].toDouble()
                : element['vote_average'],
            sortFilm: element['genre_ids'],
            session: null,
            episode: null)));
        break;
      case TypeShow.discovering:
        responeResult['results'].forEach((element) => shows.add(Show(
            id: element['id'] as int,
            title: element['name'],
            story: element['overview'],
            language: element['original_language'],
            country: element['origin_country'].length != 0
                ? element['origin_country'][0]
                : " ",
            hourWatch: null,
            director: null,
            date: DateTime.tryParse(element['first_air_date']),
            postURL: element['poster_path'],
            rating: element['vote_average'].runtimeType == int
                ? element['vote_average'].toDouble()
                : element['vote_average'],
            sortFilm: element['genre_ids'],
            session: null,
            episode: null)));        break;
      case TypeShow.details:
        // TODO: Handle this case.
        break;
      case TypeShow.list:
        // TODO: Handle this case.
        break;
    }
    return shows;
  }
}
