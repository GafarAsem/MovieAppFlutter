import 'package:flutter/material.dart';
import 'package:movie_app_flutter/Modules/type_home_film.dart';
import 'package:movie_app_flutter/Widget/type_home_widget.dart';

class PageSample extends StatefulWidget {
  List<TypeHomeFilm> _typesList;

  PageSample(this._typesList);

  @override
  _PageSampleState createState() => _PageSampleState(_typesList);
}

class _PageSampleState extends State<PageSample> {
  List<TypeHomeFilm> _typesList;

  _PageSampleState(this._typesList);

  @override
  Widget build(BuildContext context) {
   return ListView.builder(
     itemCount: _typesList.length,
     itemBuilder: (context,position){
       return TypeHomeWidget(_typesList[position]);
     },
   );
  }
}
