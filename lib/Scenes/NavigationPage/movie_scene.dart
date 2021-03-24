import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MoviePage extends StatefulWidget {
  @override
  _MoviePageState createState() => _MoviePageState();
}

class _MoviePageState extends State<MoviePage> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.horizontal,

      children: [

          _cardBuilder(context),
          _cardBuilder(context),
          _cardBuilder(context),
      ],
    );
  }

  Widget _cardBuilder(BuildContext context){
    return Center(
      child: Card(
        child: InkWell(
          splashColor: Colors.blue.withAlpha(30),
          onTap: () {
            print('Card tapped.');
          },
          child: Container(
            width: 300,
            height: 100,
            child: Text('A card that can be tapped'),
          ),
        ),
      ),
    );
  }

}
