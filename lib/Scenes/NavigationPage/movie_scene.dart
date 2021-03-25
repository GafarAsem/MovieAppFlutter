import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_app_flutter/Modules/film_module.dart';
import 'package:movie_app_flutter/Modules/movie_module.dart';
import 'package:movie_app_flutter/Modules/type_home_film.dart';
import 'package:movie_app_flutter/UI/Border.dart';
import 'package:movie_app_flutter/UI/color_movie.dart';
import 'package:movie_app_flutter/UI/text_style.dart';
import 'package:movie_app_flutter/WebService/film_data.dart';
import 'package:movie_app_flutter/WebService/tmdb_service.dart';
import 'package:movie_app_flutter/Widget/loading_widget.dart';

import '../page_sample.dart';

class MoviePage extends StatefulWidget {
  @override
  _MoviePageState createState() => _MoviePageState();
}

class _MoviePageState extends State<MoviePage> {

  @override


  @override
  Widget build(BuildContext context) {
    return PageSample([
      TypeHomeFilm(
          title: 'Trending',
          respone: TmdbService.getTrendingMovies(),
          typeFilm: TypeFilm.Movie,
          typeMovie: TypeMovie.trending
      ),
      TypeHomeFilm(
          title: 'New',
          respone: TmdbService.getNewsMovies(),
          typeFilm: TypeFilm.Movie,
          typeMovie: TypeMovie.discovering
      ),

    ]);
  }
}

