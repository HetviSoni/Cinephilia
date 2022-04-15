import 'package:flutter/material.dart';
import 'package:cinephilia/api/api.dart';
import 'package:cinephilia/api/movie_api.dart';
import 'package:cinephilia/models/movies.dart';
import 'package:cinephilia/widgets/movie_tiles.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<movieModel> bmovies = <movieModel>[];
  List<movieModel> hmovies = <movieModel>[];
  getbMovies() async{
    bollyWoodMovies bmovieList = bollyWoodMovies();
    await bmovieList.getBollywoodMovies();
    bmovies = bmovieList.bollywoodMovies;
    setState(() {

    });

  }
  gethMovies() async{
    hollywoodMovies hmovieList = hollywoodMovies();
    await hmovieList.getHollywoodMovies();
    hmovies = hmovieList.hollyWoodMovies;
    setState(() {

    });
  }

  @override
  void initState() {
    // TODO: implement initState
    getbMovies();
    gethMovies();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Trailers'),
      //   backgroundColor: Colors.deepOrangeAccent.shade200,
      // ),
      body: Container(
        color: Colors.black87,
        child: SingleChildScrollView(
          child: Column(

            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 130,
                height: 40,
                // color: Colors.green,
                child: Padding(
                  padding: const EdgeInsets.all(9.0),
                  child: Text('Bollywood',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 19,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              Container(
                height: 310,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: bmovies.length,
                  itemBuilder: (context,index) {
                    return BollywoodMovieTile(
                      id: bmovies[index].id,
                      title:bmovies[index].title,
                      posterPath: bmovies[index].posterPath,
                    );
                  },
                ),
              ),
              Container(
                // margin: EdgeInsets.only(left: 40),
                width: 130,
                height: 40,
                child: const Padding(
                  padding: EdgeInsets.all(9.0),
                  child: Text('Hollywood',
                    style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Container(
                height: 310,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: hmovies.length,
                  itemBuilder: (context,index) {
                    return HollywoodTile(
                      id: hmovies[index].id,
                      title:hmovies[index].title,
                      posterPath: hmovies[index].posterPath,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
