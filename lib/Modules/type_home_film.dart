import 'package:flutter/cupertino.dart';
import 'package:movie_app_flutter/Modules/film_module.dart';
import 'package:movie_app_flutter/WebService/film_data.dart';

class TypeHomeFilm{

   String title;
   TypeFilm typeFilm;
   var respone;
   dynamic typeMovie;
   List films;
   var uri;

  TypeHomeFilm({this.title, this.typeFilm, this.respone, this.typeMovie,this.uri});

}