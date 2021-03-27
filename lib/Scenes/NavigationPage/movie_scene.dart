import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:movie_app_flutter/Modules/film_module.dart';
import 'package:movie_app_flutter/Modules/movie_module.dart';
import 'package:movie_app_flutter/Modules/type_home_film.dart';
import 'package:movie_app_flutter/UI/Border.dart';
import 'package:movie_app_flutter/UI/color_movie.dart';
import 'package:movie_app_flutter/UI/text_style.dart';
import 'package:movie_app_flutter/WebService/film_data.dart';
import 'package:movie_app_flutter/WebService/tmdb_service.dart';
import 'package:movie_app_flutter/WebService/web_service.dart';
import 'package:movie_app_flutter/Widget/loading_widget.dart';

import '../page_sample.dart';

class MoviePage extends StatefulWidget {
  @override
  _MoviePageState createState() => _MoviePageState();
}

class _MoviePageState extends State<MoviePage> {
  var futurJson;
  List<TypeHomeFilm> _list = [
    TypeHomeFilm(
        title: 'Up Coming 2021',
        respone: WebService.getUpComingMovies(1),
        typeFilm: TypeFilm.Movie,
        typeMovie: TypeMovie.trending),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    futurJson = setJSon();
  }

  setJSon() async {
    return await rootBundle.loadString('assets/movie_geners');
  }

  getTypeHomeModel(title, generId) {
    return TypeHomeFilm(
        title: '$title',
        respone: WebService.getMovies(withGenres: generId),
        typeFilm: TypeFilm.Movie,
        typeMovie: TypeMovie.trending);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: futurJson,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData){
          Map json=jsonDecode(snapshot.data);
          json['genres'].forEach((element){ _list.add(getTypeHomeModel(element['name'],element['id']));});
          return PageSample(
              _list
          );
        }
        else{
          return LoadingWidget();
        }
      },
    );

  }
}
