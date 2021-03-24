import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';
import 'package:movie_app_flutter/UI/Border.dart';
import 'package:movie_app_flutter/UI/color_movie.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selected = 0;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(),
      bottomNavigationBar: GNav(
        activeColor: ColorMovie.blue_dark,
        color: ColorMovie.green_light,
        selectedIndex: _selected,
        tabs: [
          GButton(
            icon: Icons.movie,
            text: 'Movie'.toUpperCase(),
            active: false,
          ),
          GButton(
            icon: LineAwesomeIcons.tv,
            text: 'Show'.toUpperCase(),
            active: false,
          ),
          GButton(
            icon: LineAwesomeIcons.tablet,
            text: 'Anime'.toUpperCase(),
            active: false,
          ),
          GButton(
            icon: Icons.favorite_border_rounded,
            text: 'Stars'.toUpperCase(),
            active: false,
          ),
        ],
        onTabChange: (index) {
          setState(() {
            _selected = index;
          });
        },
      ),
    );
  }
}
