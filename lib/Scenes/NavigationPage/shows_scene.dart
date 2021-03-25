import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:movie_app_flutter/Modules/film_module.dart';
import 'package:movie_app_flutter/Modules/type_home_film.dart';
import 'package:movie_app_flutter/Scenes/page_sample.dart';
import 'package:movie_app_flutter/UI/color_movie.dart';
import 'package:movie_app_flutter/WebService/film_data.dart';
import 'package:movie_app_flutter/WebService/tmdb_service.dart';

class ShowPage extends StatefulWidget {
  @override
  _ShowPageState createState() => _ShowPageState();
}

class _ShowPageState extends State<ShowPage> {



  @override
  Widget build(BuildContext context) {

    return PageSample([
      TypeHomeFilm(
          title: 'Trending',
          respone: TmdbService.getTrendingShows(),
          typeFilm: TypeFilm.TvShow,
          typeMovie: TypeShow.trending),
      TypeHomeFilm(
          title: 'Top Rated',
          respone: TmdbService.getTopRatedShow(),
          typeFilm: TypeFilm.TvShow,
          typeMovie: TypeShow.trending),
      getTypeHomeModel('Action', '10759'),
    ]);
  }

  getTypeHomeModel(title, generId) {
    return TypeHomeFilm(
        title: 'Top $title',
        respone: TmdbService.tmdb.v3.discover.getTvShows(withGeners: generId),
        typeFilm: TypeFilm.TvShow,
        typeMovie: TypeShow.trending);
  }
}
