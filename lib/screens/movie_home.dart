import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cinephilia/screens/movie_tabs.dart';
import 'package:cinephilia/models/movie_info_model.dart';

import 'package:cinephilia/models/movie_info_tile.dart';
class MovieHome extends StatefulWidget {
  const MovieHome({Key? key}) : super(key: key);

  @override
  _MovieHomeState createState() => _MovieHomeState();
}

class _MovieHomeState extends State<MovieHome> {
  List<MovieInfo> inTheatres = <MovieInfo>[];
  List<MovieInfo> Upcoming = <MovieInfo>[];
  getTmovies() async{
    theatreMovies tmovieList = theatreMovies();
    await tmovieList.getTheatreMovies();
    inTheatres = tmovieList.inTheatre;
    setState(() {

    });
  }
  getUmovies() async{
    upcomingMovies umovieList = upcomingMovies();
    await umovieList.getUpcomingMovies();
    Upcoming= umovieList.upcoming;
    setState(() {

    });
  }

  void initState() {
    // TODO: implement initState
    getTmovies();
    getUmovies();
    super.initState();
  }
  int activeIndex=1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                    onTap: (){
                      if(activeIndex!=1)
                      {
                        activeIndex=1;
                        setState(() {

                        });
                      }
                    },
                    child: button('In Theatres',activeIndex)
                ),
                GestureDetector(
                    onTap: (){
                      activeIndex=2;
                      setState(() {

                      });
                    },
                    child: button('Upcoming',activeIndex)
                ),
                GestureDetector(
                    onTap: (){
                      activeIndex=2;
                      setState(() {

                      });
                    },
                    child:Icon(Icons.search
                    )
                ),
              ],
            ),
            Expanded(
                child:activeIndex==1? ListView.builder(
                  shrinkWrap: true,
                  itemCount: inTheatres.length,
                  itemBuilder: (context,index){
                    return MovieTile(
                      posterPath: inTheatres[index].poster_path.toString(),
                      genre_ids: inTheatres[index].genre_ids,
                      releaseDate: inTheatres[index].releaseDate,
                      vote_average: inTheatres[index].vote_average,
                      original_title: inTheatres[index].original_title,
                    );
                  },
                ):
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: Upcoming.length,
                  itemBuilder: (context,index){
                    return MovieTile(
                      posterPath: Upcoming[index].poster_path.toString(),
                      genre_ids: Upcoming[index].genre_ids,
                      releaseDate: Upcoming[index].releaseDate,
                      vote_average: Upcoming[index].vote_average,
                      original_title: Upcoming[index].original_title,
                    );
                  },
                )
            )
          ],
        ),
      ),
    );
  }
  Widget button(String type, int index)
  {
    return Container(
      width: 165,
      height: 38,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(type,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            color: Colors.white,
            fontSize: 18,
          ),
        ),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.redAccent,
      ),
    );
  }

  Widget tab(int index, String title, String movieType) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 16),
        child: InkWell(
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color:
                activeIndex == index ? Colors.redAccent : Color(0xFF333333)),
            child: Padding(
              padding:
              const EdgeInsets.symmetric(vertical: 8.0, horizontal: 18.0),
              child: Text(
                title,
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width * 0.035,
                  letterSpacing: 0.5,
                  fontWeight: FontWeight.w600,
                  fontFamily: "Poppins-Light",
                  color: activeIndex == index ? Colors.white : Color(0xFF999999),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
