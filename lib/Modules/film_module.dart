
import 'package:flutter/cupertino.dart';

enum TypeFilm { Movie, TvShow, Anime }

abstract class Film {
  final String title,
      story,
      language,
      country,
      hourWatch,
      director,
      date,
      postURL;
  final double rating;
  final List<String> sortFilm;
  bool favorite;
  final TypeFilm typeFilm;

  Film(
      {@required this.title,
      @required this.story,
      @required this.language,
      @required this.country,
      @required this.hourWatch,
      @required this.director,
      @required this.date,
      @required this.postURL,
      @required this.rating,
      @required this.sortFilm,
      @required this.typeFilm,
      this.favorite = false});

  get getTitle {
    return title;
  }

  get getStory {
    return story;
  }

  get getLanguage {
    return language;
  }

  get getCountry {
    return country;
  }

  get getHourWatch {
    return hourWatch;
  }

  get getDirector {
    return director;
  }

  get getDate {
    return date;
  }

  get getPostImageUrl {
    return postURL;
  }

  get getRating {
    return rating;
  }

  get getSorts {
    return sortFilm;
  }
}
