import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:movie_app_flutter/Modules/film_module.dart';
import 'package:movie_app_flutter/Modules/movie_module.dart';
import 'package:tmdb_api/tmdb_api.dart';

Future<void> main() async {
  runApp(MyApp());

  // TMDB tmdb = TMDB(
  //   ApiKeys('fe659aba8645a08bd849aad616d8fe6e', 'apiReadAccessTokenv4'),
  //   logConfig: ConfigLogger(
  //     showLogs: true,//must be true than only all other logs will be shown
  //     showErrorLogs: true,
  //   ),
  // );
  // Map result = await tmdb.v3;
  // print(result);
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Container(),
    );
  }
}
