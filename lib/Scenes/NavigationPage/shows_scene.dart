import 'package:flutter/cupertino.dart';
import 'package:movie_app_flutter/UI/color_movie.dart';

class ShowPage extends StatefulWidget {
  @override
  _ShowPageState createState() => _ShowPageState();
}

class _ShowPageState extends State<ShowPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorMovie.green_light,
    );
  }
}
