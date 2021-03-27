import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:movie_app_flutter/Scenes/home_page.dart';
import 'package:movie_app_flutter/UI/Border.dart';
import 'package:movie_app_flutter/UI/color_movie.dart';
import 'package:movie_app_flutter/UI/text_style.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnBorderingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
          child: new BackdropFilter(
            filter: new ImageFilter.blur(sigmaX: 1.0, sigmaY: 1.0),
            child: new Container(
              decoration: new BoxDecoration(
                  color: ColorMovie.blue_white.withOpacity(0.3)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  //icon app
                  Padding(
                    padding: EdgeInsets.only(
                      right: width / 7,
                      left: width / 7,
                    ),
                    child: Image(
                      image: AssetImage('images/ic_launcher_foreground.png'),
                    ),
                  ),
                  //button started
                  Container(
                    width: width / 1.2,
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: ColorMovie.blue_white,
                          onPrimary: ColorMovie.blue_dark,
                          shape: BorderCirculer.shapeStyle(15)),
                      onPressed: () {
                        setShared();
                        Navigator.pop(context);
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));

                      },
                      child: Text(
                        'Get Started',
                        style: MyTextStyle.getMyStyle(
                            color: Colors.white, fontWeight: FontWeight.w400),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          //image background
          decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage(width<height?'images/background.png':'images/background_desktop.png'),
            fit: BoxFit.cover,
          ))),
    );
  }
}

void setShared() async {
  final prf = await SharedPreferences.getInstance();
  prf.setBool('first', true);
}
