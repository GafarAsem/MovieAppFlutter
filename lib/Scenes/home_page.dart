import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';
import 'package:movie_app_flutter/Modules/film_module.dart';
import 'package:movie_app_flutter/Modules/type_home_film.dart';
import 'package:movie_app_flutter/Scenes/NavigationPage/anime_scene.dart';
import 'package:movie_app_flutter/Scenes/NavigationPage/favorite_scene.dart';
import 'package:movie_app_flutter/Scenes/NavigationPage/movie_scene.dart';
import 'package:movie_app_flutter/Scenes/NavigationPage/shows_scene.dart';
import 'package:movie_app_flutter/Scenes/seeall_page.dart';
import 'package:movie_app_flutter/UI/Border.dart';
import 'package:movie_app_flutter/UI/color_movie.dart';
import 'package:movie_app_flutter/UI/text_style.dart';
import 'package:movie_app_flutter/WebService/film_data.dart';
import 'package:movie_app_flutter/WebService/web_service.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selected = 0;
  PageController _controllPages = PageController();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 20,
        title: Text(
          'Movies',
          style: MyTextStyle.getMyStyle(
              color: ColorMovie.blue_dark, font: 30, fontWeight: FontWeight.w400),
        ),
        actions: [
          IconButton(
            icon: Icon(
              CupertinoIcons.search,
              color: ColorMovie.blue_dark,
              size: 35,
            ), onPressed: () { Navigator.push(context, MaterialPageRoute(
             builder: (context)=>SeeAllPage(TypeHomeFilm(
                 title: 'Search',
               typeFilm: TypeFilm.Movie,
               typeMovie: TypeMovie.trending,
               respone: WebService.searchMovie('inception')
              ))
          )) ;},
          ),
        ],
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: PageView.builder(
        controller: _controllPages,
        onPageChanged: (position) {
          setState(() {
            _selected = position;
          });
        },
        itemBuilder: (context, position) {
          var _page;
          switch (position) {
            case 0:
              _page = MoviePage();
              break;
            case 1:
              _page = ShowPage();
              break;
            case 2:
              _page = AnimePage();
              break;
            case 3:
              _page = FavoritePage();
              break;
          }
          return _page;
        },
        itemCount: 4, // Can be null
      ),
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
            _controllPages.jumpToPage(_selected);
          });
        },
      ),
    );
  }
}
