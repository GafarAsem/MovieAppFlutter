import 'package:flutter/material.dart';
import 'package:movie_app_flutter/Modules/film_module.dart';
import 'package:movie_app_flutter/Modules/type_home_film.dart';
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
            Padding(
              padding: const EdgeInsets.only(left: 27, bottom: 15, top: 10,right: 15),
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
                  Text(
                  'See All',
                  style: MyTextStyle.getMyStyle(
                      color: Colors.lightBlueAccent,
                      fontWeight: FontWeight.normal,
                      font: 15),
                ),
                ],
              )
            ),
            FutureBuilder(
                future: _typeHomeFilm.respone,
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    if(_typeHomeFilm.typeFilm==TypeFilm.Movie) {
                      if (_typeHomeFilm.typeMovie == TypeMovie.list)
                        _typeHomeFilm.films = FilmData.getMovies(
                            snapshot.data['items'], _typeHomeFilm.typeMovie);
                      else
                        _typeHomeFilm.films = FilmData.getMovies(
                            snapshot.data, _typeHomeFilm.typeMovie);
                    }else{
                      _typeHomeFilm.films = FilmData.getShows(
                          snapshot.data, _typeHomeFilm.typeMovie);
                    }
                    return ListView.builder(
                      physics: BouncingScrollPhysics(
                          parent: AlwaysScrollableScrollPhysics()),
                      itemCount: _typeHomeFilm.films.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context, int index) =>
                          CardMovieBuilder(_typeHomeFilm.films[index]),
                    );
                  } else {
                    return LoadingWidget();
                  }
                }),
          ],
        ));
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
                  // RawMaterialButton(
                  //   fillColor: Colors.white,
                  //   shape: CircleBorder(),
                  //   onPressed: () {},
                  //   elevation: 10,
                  //   child: Icon(
                  //     Icons.favorite_outline,
                  //     color: ColorMovie.blue_dark,
                  //   ),
                  // ),
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
    ;
  }
}
