import 'dart:convert';
import 'package:cinephilia/models/movie_info_model.dart';
import 'package:http/http.dart' as http;
class theatreMovies{
  List<MovieInfo> inTheatre =[];

  Future<void> getTheatreMovies() async{
    var response = await http.get(Uri.parse("https://api.themoviedb.org/3/movie/now_playing?api_key=5b81a5691687fb4b7827318805cd5e10&language=en-US"));
    var jsonData = jsonDecode(response.body);
    jsonData['results'].forEach((element)
    {
      MovieInfo newMovie = MovieInfo(
        poster_path: element['poster_path'],
        original_title: element['original_title'],
        genre_ids: element['genre_ids'],
        id: element['id'],
        vote_average: element['vote_average'],
        releaseDate: element['release_date'],
      );
      print(element['original_title']);
      inTheatre.add(newMovie);
    });

  }
}
class upcomingMovies{
  List<MovieInfo> upcoming =[];

  Future<void> getUpcomingMovies() async{
    var response = await http.get(Uri.parse("https://api.themoviedb.org/3/movie/upcoming?api_key=5b81a5691687fb4b7827318805cd5e10&language=en-US"));
    var jsonData = jsonDecode(response.body);
    jsonData['results'].forEach((element)
    {
      MovieInfo newMovie = MovieInfo(
        poster_path: element['poster_path'],
        original_title: element['original_title'],
        genre_ids: element['genre_ids'],
        id: element['id'],
        vote_average: element['vote_average'],
        releaseDate: element['release_date'],
      );
      print(element['original_title']);
      upcoming.add(newMovie);
    });

  }
}
class searchMovies{
  List<MovieInfo> searchedMovies =[];

  Future<void> getSearchMovies(String query) async{

    var response = await http.get(Uri.parse("https://api.themoviedb.org/3/search/movie?api_key=5b81a5691687fb4b7827318805cd5e10&query="+query));
    var jsonData = jsonDecode(response.body);
    if (response.statusCode == 200) {
      jsonData['results'].forEach((element)
      {
        MovieInfo newMovie = MovieInfo(
          poster_path: element['poster_path'],
          original_title: element['original_title'],
          genre_ids: element['genre_ids'],
          id: element['id'],
          vote_average: element['vote_average'],
          releaseDate: element['release_date'],
        );
        print(element['original_title']);
        searchedMovies.add(newMovie);
      });
    } else {
      throw Exception();
    }


  }
}