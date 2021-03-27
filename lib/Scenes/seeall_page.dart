import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_app_flutter/Modules/type_home_film.dart';
import 'package:movie_app_flutter/UI/color_movie.dart';
import 'package:movie_app_flutter/UI/text_style.dart';
import 'package:movie_app_flutter/WebService/film_data.dart';
import 'package:movie_app_flutter/WebService/tmdb_service.dart';
import 'package:movie_app_flutter/Widget/loading_widget.dart';

class SeeAllPage extends StatefulWidget {
  TypeHomeFilm typeHomeFilm;

  SeeAllPage(this.typeHomeFilm);

  @override
  _SeeAllPageState createState() => _SeeAllPageState();
}

class _SeeAllPageState extends State<SeeAllPage> {
  var respone = TmdbService.getUpComingMovies(1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 5.0),
              child: Text(
                widget.typeHomeFilm.title + ' list',
                style: MyTextStyle.getMyStyle(
                    color: Colors.grey, fontWeight: FontWeight.w400),
              ),
            ),
            Container(
                height: MediaQuery.of(context).size.height - 150,
                child: FutureBuilder(
                  future: respone,
                  builder:
                      (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                    if (snapshot.hasData) {
                      var _typeHomeFilm = TypeHomeFilm(respone: snapshot.data);
                      _typeHomeFilm.films = FilmData.getMovies(
                          _typeHomeFilm.respone, widget.typeHomeFilm.typeMovie);
                      return GridViewPage(_typeHomeFilm);
                    } else {
                      return LoadingWidget();
                    }
                  },
                )),
          ],
        ),
      ),
    );
  }
}

class GridViewPage extends StatefulWidget {
  TypeHomeFilm typeHomeFilm;

  GridViewPage(this.typeHomeFilm);

  @override
  _GridViewPageState createState() => _GridViewPageState(typeHomeFilm);
}

class _GridViewPageState extends State<GridViewPage> {
  TypeHomeFilm typeHomeFilm;

  _GridViewPageState(this.typeHomeFilm);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
      shrinkWrap: true,
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1,
          mainAxisExtent: 250*1.5),
      itemBuilder: (context, index) {
        if (index >= typeHomeFilm.films.length - 1) {
          var respone = TmdbService.getUpComingMovies(2);
          return FutureBuilder(
            future: respone,
            builder: (BuildContext context,
                AsyncSnapshot<Map<dynamic, dynamic>> snapshot) {
              if (snapshot.hasData) {
                typeHomeFilm.films.addAll(
                    FilmData.getMovies(snapshot.data, TypeMovie.trending));
                print(FilmData.getMovies(snapshot.data, TypeMovie.discovering)
                    .length);
                print(typeHomeFilm.films.length);
                return GridCardMovie(typeHomeFilm.films[index]);
              } else {
                return LoadingWidget();
              }
            },
          );
        }

        return GridCardMovie(typeHomeFilm.films[index]);
      },
    );
  }

// void setNewMovies() async{
//
//   typeHomeFilm.films.addAll(FilmData.getMovies(respone, typeHomeFilm.typeMovie));
// }
}

class GridCardMovie extends StatelessWidget {
  var film;

  GridCardMovie(this.film);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 250*1.5,
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
                        image: NetworkImage('https://image.tmdb.org/t/p/w300' +
                            film.getPostImageUrl),
                        fit: BoxFit.cover)),
                width: 130*1.5,
                height: 300,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                width: 45,
                height: 45,
                child: Center(
                  child: Text(
                    film.getRating.toString(),
                    style: MyTextStyle.getMyStyle(
                        color: ColorMovie.blue_dark, font: 20),
                  ),
                ),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.center,
                      end: Alignment.topRight,
                      colors: [ColorMovie.white_green, ColorMovie.blue_white]),
                  shape: BoxShape.circle,
                ),
              ),
              Positioned(
                bottom: 2,
                left: 0,
                right: 0,
                child: ImageFiltered(
                  imageFilter: ImageFilter.blur(sigmaX: 0.5, sigmaY: 0.5),
                  child: Center(
                    child: Container(
                      width: 100,
                      decoration: new BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: ColorMovie.blue_dark.withOpacity(0.3)),
                      child: Text(
                        film.getDate.year.toString(),
                        textAlign: TextAlign.center,
                        style: MyTextStyle.getMyStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            font: 20),
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
                font: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}