import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:movie_app_flutter/Modules/film_module.dart';
import 'package:movie_app_flutter/Modules/movie_module.dart';
import 'package:movie_app_flutter/WebService/film_data.dart';
import 'package:movie_app_flutter/WebService/tmdb_service.dart';
import 'package:tmdb_api/tmdb_api.dart';

Future<void> main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Container(),
    );
  }
}
