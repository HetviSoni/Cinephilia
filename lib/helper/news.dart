import 'dart:convert';
import 'package:cinephilia/models/article_model.dart';
import 'package:http/http.dart' as http;
class News{
  List<ArticleModel> news = [];
  Future<void> getNews() async{
    String url = "https://newsapi.org/v2/top-headlines?country=in&category=entertainment&apiKey=ca1c6436564d4100ac5d798f0752a332";
    var response = await http.get(Uri.parse("https://newsapi.org/v2/top-headlines?country=in&category=entertainment&apiKey=ca1c6436564d4100ac5d798f0752a332"));
    var jsonData = jsonDecode(response.body);
    if(jsonData['status']=='ok'){
      jsonData['articles'].forEach((element){
        if(element['urlToImage']!=null && element['description']!=null)
        {
          ArticleModel articleModel = ArticleModel(
            title: element['title'],
            description: element['description'],
            urlToImage: element['urlToImage'],
            url: element['url'],

          );
          news.add(articleModel);
        }
      });
    }
  }
}