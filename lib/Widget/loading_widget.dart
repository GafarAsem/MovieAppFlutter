
import 'package:flutter/material.dart';
import 'package:movie_app_flutter/UI/color_movie.dart';

class LoadingWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child:  Center(
        child: CircularProgressIndicator(
        backgroundColor: ColorMovie.white_green,
    ),
      ),
    );
  }
}
