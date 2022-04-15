import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cinephilia/helper/news.dart';
import 'package:cinephilia/models/article_model.dart';
import 'package:cinephilia/views/article_view.dart';

class NewsHome extends StatefulWidget {
  const NewsHome({Key? key}) : super(key: key);
  _NewsHomeState createState() => _NewsHomeState();
}

class _NewsHomeState extends State<NewsHome> {
  List<ArticleModel> articles = <ArticleModel>[];
  bool isLoading=false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getNews();
  }
  getNews()async{
    News news = News();
    isLoading=true;
    await news.getNews();
    articles = news.news;
    setState(() {
      isLoading=false;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text('Top'),
              Text('News', style: TextStyle(color: Colors.yellow),),
            ],
          )
      ),
      body:isLoading?
      Center(
        child: CircularProgressIndicator(),
      ) :
      Container(
        color: Colors.black,
        padding: EdgeInsets.all(10),
        child: ListView.builder(
          itemCount: articles.length,
          shrinkWrap: true,
          itemBuilder: (context,index){
            return newsTile(
              description: articles[index].description,
              imageUrl: articles[index].urlToImage,
              title: articles[index].title,
              url: articles[index].url,
            );},
        ),
      ),
    );
  }
}
class newsTile extends StatelessWidget {
  const newsTile({required this.imageUrl, required this.title,required this.description,required this.url}) ;
  final String imageUrl, title,description,url;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context,
            MaterialPageRoute(builder: (context)=>WebViewApp(
              url: url,
            ),));
      },
      child: Container(
          margin: EdgeInsets.only(bottom: 15),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(imageUrl),

              ),
              Text(title,
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
              // Text(description),
            ],
          )
      ),
    );
  }
}


