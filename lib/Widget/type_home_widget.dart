import 'dart:ui';

import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_app_flutter/Modules/film_module.dart';
import 'package:movie_app_flutter/Modules/type_home_film.dart';
import 'package:movie_app_flutter/Scenes/seeall_page.dart';
import 'package:movie_app_flutter/UI/color_movie.dart';
import 'package:movie_app_flutter/UI/text_style.dart';
import 'package:movie_app_flutter/WebService/film_data.dart';
import 'package:movie_app_flutter/Widget/loading_widget.dart';

class TypeHomeWidget extends StatefulWidget {
  TypeHomeFilm _typeHomeFilm;

  TypeHomeWidget(this._typeHomeFilm);

  @override
  _TypeHomeWidgetState createState() => _TypeHomeWidgetState(_typeHomeFilm);
}

class _TypeHomeWidgetState extends State<TypeHomeWidget> {
  TypeHomeFilm _typeHomeFilm;

  _TypeHomeWidgetState(this._typeHomeFilm);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 275,
        child: Stack(
          children: [
            FutureBuilder(
                future: _typeHomeFilm.respone,
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    if (_typeHomeFilm.typeFilm == TypeFilm.Movie) {
                      if (_typeHomeFilm.typeMovie == TypeMovie.list)
                        _typeHomeFilm.films = FilmData.getMovies(
                            snapshot.data['items'], _typeHomeFilm.typeMovie);
                      else
                        _typeHomeFilm.films = FilmData.getMovies(
                            snapshot.data, _typeHomeFilm.typeMovie);
                    } else {
                      _typeHomeFilm.films = FilmData.getShows(
                          snapshot.data, _typeHomeFilm.typeMovie);
                    }
                    return ListView.builder(
                        physics: BouncingScrollPhysics(
                            parent: AlwaysScrollableScrollPhysics()),
                        itemCount: _typeHomeFilm.films.length + 1,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, int index) {
                          if (index != _typeHomeFilm.films.length)
                            return CardMovieBuilder(_typeHomeFilm.films[index]);
                          else
                            return cardEndFilms(context);
                        });
                  } else {
                    return LoadingWidget();
                  }
                }),
            Padding(
                padding: const EdgeInsets.only(
                    left: 10, bottom: 15, top: 10, right: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      _typeHomeFilm.title,
                      style: MyTextStyle.getMyStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.normal,
                          font: 17),
                    ),
                    // ignore: deprecated_member_use
                    GestureDetector(
                      onTapUp: (_) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    SeeAllPage(_typeHomeFilm)));
                      },
                      child: Text(
                        'See All',
                        style: MyTextStyle.getMyStyle(
                            color: Colors.lightBlueAccent,
                            fontWeight: FontWeight.normal,
                            font: 15),
                      ),
                    ),
                  ],
                )),
          ],
        ));
  }

  Widget cardEndFilms(context) {
    return Center(
      child: Padding(
          padding: const EdgeInsets.only(right: 5, left: 5, top: 35),
          child: Container(
            height: 200,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: ColorMovie.blue_dark.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 9,
                        offset: Offset(0, 10), // changes position of shadow
                      ),
                    ],
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: ColorMovie.blue_white,
                  ),
                  child: Center(
                      child: Text(
                    'More',
                    style:
                        MyTextStyle.getMyStyle(color: Colors.white, font: 30),
                  )),
                  width: 100,
                  height: 170,
                ),
                Text(''),
              ],
            ),
          )),
    );
  }
}

class CardMovieBuilder extends StatelessWidget {
  var film;

  CardMovieBuilder(this.film);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
          padding: const EdgeInsets.only(right: 5, left: 5, top: 35),
          child: Container(
            height: 250,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Stack(alignment: Alignment.topRight, children: [
                  Container(
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 9,
                            offset: Offset(0, 10), // changes position of shadow
                          ),
                        ],
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        image: DecorationImage(
                            image: NetworkImage(
                                'https://image.tmdb.org/t/p/w300' +
                                    film.getPostImageUrl),
                            fit: BoxFit.cover)),
                    width: 130,
                    height: 200,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    width: 30,
                    height: 30,
                    child: Center(
                      child: Text(
                        film.getRating.toString(),
                        style: MyTextStyle.getMyStyle(
                            color: ColorMovie.blue_dark, font: 15),
                      ),
                    ),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.center,
                          end: Alignment.topRight,
                          colors: [
                            ColorMovie.white_green,
                            ColorMovie.blue_white
                          ]),
                      shape: BoxShape.circle,
                    ),
                  ),
                  Positioned(
                    bottom: 2,
                    left: 0,
                    right: 0,
                    child: ImageFiltered(
                      imageFilter: ImageFilter.blur(sigmaX: 0.5,sigmaY: 0.5),
                      child: Center(
                        child: Container(
                          width: 50,
                          decoration: new BoxDecoration(
                           borderRadius: BorderRadius.circular(10),
                              color: ColorMovie.blue_dark.withOpacity(0.3)),
                          child: Text(
                            film.getDate.year.toString(),
                            textAlign: TextAlign.center,
                            style: MyTextStyle.getMyStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                font: 16),
                          ),
                        ),
                      ),
                    ),
                  ),
                ]),
                Text(
                  film.getTitle.length > 14
                      ? film.getTitle.substring(0, 14) + "..."
                      : film.getTitle,
                  style: MyTextStyle.getMyStyle(
                    color: ColorMovie.blue_dark,
                    fontWeight: FontWeight.normal,
                    font: 15,
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
