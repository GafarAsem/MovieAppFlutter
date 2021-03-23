import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:movie_app_flutter/UI/color_movie.dart';
import 'package:movie_app_flutter/UI/text_style.dart';

class OnBordingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Padding(
              padding: EdgeInsets.only(
                  right: width / 3,
                  left: width / 3,
                  top: height / 7,
                  bottom: height / 6),
              child: Image(
                image: AssetImage('images/icon_app_dark.png'),
              ),
            ),
            ElevatedButton(
                onPressed: () {},
                child: Text(
                  'OK',
                  style: MyTextStyle.getMyStyle(color: Colors.white),
                ))
          ],
        ),
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('images/background.png'),
                fit: BoxFit.cover,
                colorFilter:
                    ColorFilter.mode(ColorMovie.blue_dark, BlendMode.lighten))),
      ),
    );
  }
}
