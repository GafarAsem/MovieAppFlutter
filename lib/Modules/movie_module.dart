import 'package:flutter/cupertino.dart';
import 'package:movie_app_flutter/Modules/film_module.dart';

class Movie extends Film {
  Movie(
      {@required String title,
      @required int id,
      @required String story,
      @required String language,
      @required String country,
      @required String hourWatch,
      @required String director,
      @required DateTime date,
      @required String postURL,
      @required double rating,
      @required List<dynamic> sortFilm,
      bool favorite = false})
      : super(
            id: id,
            title: title,
            story: story,
            language: language,
            country: country,
            hourWatch: hourWatch,
            director: director,
            date: date,
            postURL: postURL,
            rating: rating,
            sortFilm: sortFilm,
            typeFilm: TypeFilm.Movie,
            favorite: favorite);
}
