import 'package:movie_app_flutter/Modules/film_module.dart';
import 'package:movie_app_flutter/WebService/film_data.dart';

class TypeHomeFilm{

   String title;
   TypeFilm typeFilm;
   var respone;
   dynamic typeMovie;
   List films;

  TypeHomeFilm({this.title, this.typeFilm, this.respone, this.typeMovie});

}