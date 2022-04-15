import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:cinephilia/models/movies.dart';

class bollyWoodMovies{
  List<movieModel> bollywoodMovies = [];
  //=================for bollywood movies============
  Future<void> getBollywoodMovies()async {
    var response = await http.get(Uri.parse("https://api.themoviedb.org/3/movie/upcoming?api_key=5b81a5691687fb4b7827318805cd5e10&language=en-US&with_original_language=hi"));
    var jsonData = jsonDecode(response.body);
    jsonData['results'].forEach((element){
      movieModel newMovie = movieModel(
        originalLanguage: element['original_language'],
        title:element['title'],
        id: element['id'],
        posterPath: element['poster_path'],

      );
      print(element['title']);
      bollywoodMovies.add(newMovie);
    });
  }
}
class hollywoodMovies{
  List<movieModel> hollyWoodMovies = [];
  //=================for bollywood movies============
  Future<void> getHollywoodMovies()async {
    var response = await http.get(Uri.parse("https://api.themoviedb.org/3/movie/upcoming?api_key=5b81a5691687fb4b7827318805cd5e10&language=en-US&with_original_language=en"));
    var jsonData = jsonDecode(response.body);
    jsonData['results'].forEach((element){
      movieModel newMovie = movieModel(
        originalLanguage: element['original_language'],
        title:element['title'],
        id: element['id'],
        posterPath: element['poster_path'],

      );
      print(element['title']);
      hollyWoodMovies.add(newMovie);
    });
  }
}