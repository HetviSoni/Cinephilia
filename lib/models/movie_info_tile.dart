import 'package:flutter/material.dart';
class MovieTile extends StatefulWidget {
  String posterPath;
  String original_title;
  List<dynamic> genre_ids;
  num vote_average;
  String releaseDate;
  MovieTile({required this.posterPath , required this.original_title
    , required this.genre_ids, required this.vote_average, required this.releaseDate,
  }) ;

  @override
  _MovieTileState createState() => _MovieTileState();
}

class _MovieTileState extends State<MovieTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsets.only(top: 10),
      color: Colors.black87,
      child: Padding(
        padding: const EdgeInsets.only(top:8.0),
        child: Stack(
            children: [
              Card(
                margin: EdgeInsets.only(top: 15),
                elevation: 0,
                shadowColor: Colors.black,
                color: Colors.greenAccent[100],
                child: SizedBox(
                  width: 380,
                  height: 130,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                  ), //Padding
                ), //SizedBox
              ), //Card
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 1),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.network('http://image.tmdb.org/t/p/w500'+widget.posterPath,
                        width: 100,
                        height: 150,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    color: Colors.blue,
                    height: 110,
                    width: 260,
                    child: Column(
                      children: [
                        Text(widget.original_title),
                        Text(
                          "⭐ "+ widget.vote_average.toString() ,
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w200,
                              fontFamily: "Poppins-Semibold",
                              fontSize: MediaQuery.of(context)
                                  .size
                                  .width *
                                  0.033),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ]
        ),
      ),
    );
  }
}
