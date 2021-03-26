import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:movie_app_flutter/Modules/film_module.dart';
import 'package:movie_app_flutter/Modules/type_home_film.dart';
import 'package:movie_app_flutter/Scenes/page_sample.dart';
import 'package:movie_app_flutter/UI/color_movie.dart';
import 'package:movie_app_flutter/WebService/film_data.dart';
import 'package:movie_app_flutter/WebService/tmdb_service.dart';
import 'package:movie_app_flutter/Widget/loading_widget.dart';

class ShowPage extends StatefulWidget {
  @override
  _ShowPageState createState() => _ShowPageState();
}

class _ShowPageState extends State<ShowPage> {

  var futurJson;
  List<TypeHomeFilm> _list = [
    TypeHomeFilm(
        title: 'Top Rated',
        respone: TmdbService.getTopRatedShow(),
        typeFilm: TypeFilm.TvShow,
        typeMovie: TypeShow.trending),
  ];
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    futurJson = setJSon();
  }
  setJSon() async {
    return await rootBundle.loadString('assets/tv_geners');
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

  getTypeHomeModel(title, generId) {
    return TypeHomeFilm(
        title: 'Top $title',
        respone: TmdbService.tmdb.v3.discover.getTvShows(withGeners: generId),
        typeFilm: TypeFilm.TvShow,
        typeMovie: TypeShow.trending);
  }
}
