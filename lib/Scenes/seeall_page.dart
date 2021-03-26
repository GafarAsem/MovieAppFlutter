import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_app_flutter/Modules/type_home_film.dart';
import 'package:movie_app_flutter/UI/color_movie.dart';
import 'package:movie_app_flutter/UI/text_style.dart';

class SeeAllPage extends StatelessWidget {
  TypeHomeFilm typeHomeFilm;

  SeeAllPage(this.typeHomeFilm);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar:  AppBar(
            titleSpacing: 20,
            title: Text(
              typeHomeFilm.title+'List',
              style: MyTextStyle.getMyStyle(
                  color: ColorMovie.blue_white, font: 30, fontWeight: FontWeight.w400),
            ),
            actions: [
              RichText(text: TextSpan(
                children: [
                  WidgetSpan(
                    child: Icon(
                      CupertinoIcons.back,
                      color:Colors.black,

                    ),
                  ),
                  TextSpan(text: 'back',style: MyTextStyle.getMyStyle(color: Colors.black,fontWeight: FontWeight.normal))
                ]
              ))
            ],
            backgroundColor: Colors.white,
            elevation: 0,
          ),
    );
  }
}
