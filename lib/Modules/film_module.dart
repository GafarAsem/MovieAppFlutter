import 'dart:ffi';

enum TypeFilm { Movie, TvShow, Anime }

 class Film {
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
  final typeFilm;

  Film({
      this.title,
      this.story,
      this.language,
      this.country,
      this.hourWatch,
      this.director,
      this.date,
      this.postURL,
      this.rating,
      this.sortFilm,
      this.typeFilm,
      this.favorite = false
      });

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
