
import 'package:tmdb_api/tmdb_api.dart';

class TmdbService {
  static var _apiToken = 'fe659aba8645a08bd849aad616d8fe6e';
  static TMDB tmdb = TMDB(
    ApiKeys(_apiToken, 'apiReadAccessTokenv4'),
  );

  static Future<Map> getTrendingMovies() async {
    var movies =
        await tmdb.v3.trending.getTrending(mediaType: MediaType.movie);
    return movies;
  }


  static Future<Map> getTrendingShows() async {
    var shows = await tmdb.v3.trending.getTrending(mediaType: MediaType.tv);
    return shows;
  }

  static Future<Map> getDiscoverMovies() async {
    var movies = await tmdb.v3.discover.getMovies();
    return movies;
  }
  static Future<Map> getMovieDetails(int movieId) async {
    var movie = await tmdb.v3.movies.getDetails(movieId);
    return movie;
  }
  static Future<Map> getShowDetails(int showId) async {
    var movie = await tmdb.v3.tv.getDetails(showId);
    return movie;
  }
  static Future<Map> getDiscoverShows() async {
    var shows = await tmdb.v3.discover.getTvShows();
    return shows;
  }

  static Future<Map> searchMovie(String movieSearch, int pages) async {
    var movies = await tmdb.v3.search.queryMovies(movieSearch, page: pages);
    return movies;
  }

  static Future<Map> getShows(String showSearch, int pages) async {
    var shows = await tmdb.v3.search.queryTvShows(showSearch, page: pages);
    return shows;
  }

  static Future<Map> getList(int idList) async {
    var _apiTokenV4 =
        'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJmZTY1OWFiYTg2NDVhMDhiZDg0OWFhZDYxNmQ4ZmU2ZSIsInN1YiI6IjYwNTg1MjgwMDFlNGQxMDA1MzY0ODkxYiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.48WtIrSejqybBU0aqEaQGg2XuWJeWTYhPb6-zQBI67o';
    var List = await tmdb.v4.lists.getList(_apiTokenV4, idList);
    return List;
  }

  static Future<Map> getUpComingMovies() async {
    var movies = await tmdb.v3.movies.getUpcoming();
    return movies;
  }

  static Future<Map> getTopRatedMovies() async {
    var movies = await tmdb.v3.movies.getTopRated();
    return movies;
  }
  static Future<Map> getListMovies(String listID) async {
    var movies = await tmdb.v3.lists.getDetails(listID);
    return movies;
  }
  static Future<Map> getTopRatedShow() async {
    var show = await tmdb.v3.tv.getTopRated();
    return show;
  }


  // static Future<Map> getGenersMovies() async {
  //   var movies = await _tmdb.v3.geners.getMovieList();
  //   return movies;
  // }
}
