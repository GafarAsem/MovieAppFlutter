import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:movie_app_flutter/UI/color_movie.dart';

class MyTextStyle {
  static TextStyle getMyStyle(
      {double font = 20,
      @required Color color,
      FontWeight fontWeight = FontWeight.bold}) {
    return TextStyle(fontSize: font, color: color, fontWeight: fontWeight);
  }
}
