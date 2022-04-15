import 'dart:convert';
import 'package:http/http.dart' as http;
class genreModel{
  late String name;
  late int id;
  genreModel({required this.name, required this.id});
}
class genre{
  List<genreModel> genreList =[];
  Future<void> getGenreList() async{
    String url = "https://api.themoviedb.org/3/genre/movie/list?api_key=5b81a5691687fb4b7827318805cd5e10";
    var response = await http.get(Uri.parse(url));
    var jsonData = jsonDecode(response.body);
    jsonData['genres'].forEach((element){
      // print(element['name'].toString());
      genreModel model = genreModel(
        name: element['name'],
        id: element['id'],
      );
      genreList.add(model);
    });
  }
}