import 'package:movie_app_flutter/WebService/tmdb_service.dart';
import 'package:tmdb_api/tmdb_api.dart';
import 'package:http/http.dart' as http;

class WebService{
  static var _apiToken = 'fe659aba8645a08bd849aad616d8fe6e';
  static var url='api.themoviedb.org';

  static Future<List> getTrendingMovies(int pages) async {
    String path='/3/trending/movie/day';
    var uri=Uri.https(
        url,
        path,
        {
          'api_key':_apiToken,
          'language':'en-US',
          'page':pages.toString()
        }
    );
    var movies =
    await http.get(uri);
    return [movies.body,uri];
  }


  static Future<List> getTrendingShows(  int pages) async {
    String path='/3/trending/tv/day';
    var uri=Uri.https(
        url,
        path,
        {
          'api_key':_apiToken,
          'language':'en-US',
          'page':pages.toString()
        }
    );
    var shows =
    await http.get(uri);
    return [shows.body,uri];
  }

  static Future<List> getDiscoverMovies(  int pages) async {
    String path='/3/discover/movie';
    var uri=Uri.https(
        url,
        path,
        {
          'api_key':_apiToken,
          'language':'en-US',
          'page':pages.toString()
        }
    );
    var movies =
    await http.get(uri);
    return [movies.body,uri];
  }
  static Future<List> getMovieDetails(int movieId) async {
    String path='/3/movie/{$movieId}';
    var uri=Uri.https(
        url,
        path,
        {
          'api_key':_apiToken,
          'language':'en-US',
        }
    );
    var movies =
    await http.get(uri);
    return [movies.body,uri];
  }
  static Future<List> getShowDetails(int showId) async {
    String path='/3/tv/{$showId}';
    var uri=Uri.https(
        url,
        path,
        {
          'api_key':_apiToken,
          'language':'en-US',
        }
    );
    var shows =
    await http.get(uri);
    return [shows.body,uri];
  }
  static Future<List> getDiscoverShows(  int pages) async {
    String path='/3/discover/tv';
    var uri=Uri.https(
        url,
        path,
        {
          'api_key':_apiToken,
          'language':'en-US',
          'page':pages.toString()
        }
    );
    var shows =
    await http.get(uri);
    return [shows.body,uri];
  }

  static Future<List> getUpComingMovies(int page) async {
    String path='3/movie/upcoming';
    var uri=Uri.https(
        url,
        path,
        {
          'api_key':_apiToken,
          'language':'en-US',
          'page':page.toString()
        }
    );
    var movies =
    await http.get(uri);
    return [movies.body,uri];
  }

  static Future<List> getTopRatedMovies(int pages) async {
    String path='3/movie/top_rated';
    var uri=Uri.https(
        url,
        path,
        {
          'api_key':_apiToken,
          'language':'en-US',
          'page':pages.toString()
        }
    );
    var movies =
    await http.get(uri);
    return [movies.body,uri];
  }

  static Future<List> getTopRatedShow(  int pages) async {
    String path='3/tv/top_rated';
    var uri=Uri.https(
        url,
        path,
        {
          'api_key':_apiToken,
          'language':'en-US',
          'page':pages.toString()
        }
    );
    var shows =
    await http.get(uri);
    return [shows.body,uri];
  }

  static getMovies({withGenres}) async {
    String path='/3/discover/movie';
    var uri=Uri.https(
        url,
        path,
        {
          'api_key':_apiToken,
          'language':'en-US',
          'page':'1',
          'with_genres':withGenres.toString()
        }
    );
    var shows =
        await http.get(uri);
    return [shows.body,uri];
  }
  static getShows({withGenres}) async {
    String path='/3/discover/tv';
    var uri=Uri.https(
        url,
        path,
        {
          'api_key':_apiToken,
          'language':'en-US',
          'page':'1',
          'with_genres':withGenres.toString()
        }
    );
    var shows =
        await http.get(uri);
    return [shows.body,uri];
  }


// static Future<Map> getGenersMovies() async {
//   var movies = await _tmdb.v3.geners.getMovieList();
//   return movies;
// }
}