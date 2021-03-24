import 'package:flutter/material.dart';
import 'package:movie_app_flutter/Scenes/home_page.dart';
import 'package:movie_app_flutter/Scenes/onbording.dart';
import 'package:movie_app_flutter/UI/color_movie.dart';
import 'package:movie_app_flutter/Widget/loading_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Future<SharedPreferences> prf;
  bool isStart;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    prf=getSharedInstance();

  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MOA App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      //if new user or old user
      home: FutureBuilder(
        future: prf,
        builder: (BuildContext context,AsyncSnapshot snapshot){
          if(snapshot.hasData){
           if(isStart){
             return HomePage();
           }
           else{
             return OnBorderingPage();
           }
          }
          else{
            return LoadingWidget();
          }
        },
      )
    );
  }

  Future<SharedPreferences> getSharedInstance()async {
    final prf= await SharedPreferences.getInstance();

    isStart=prf.getBool('first');
    // ignore: unnecessary_statements
    isStart==null?isStart=false:null;
    return prf;
  }
}
