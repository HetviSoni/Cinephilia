import 'dart:async';
import 'dart:convert';
import 'package:cinephilia/screens/trailer_screen.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class BollywoodMovieTile extends StatefulWidget {
  final String title;
  final String? posterPath;
  final int id;
  BollywoodMovieTile({required this.title, required this.posterPath,required this.id}) ;

  @override
  _BollywoodMovieTileState createState() => _BollywoodMovieTileState();
}

class _BollywoodMovieTileState extends State<BollywoodMovieTile> {
  // @override
  Future<String> getLink(int id) async{
    try {
      String idt = id.toString();
      var response = await http.get(Uri.parse("https://api.themoviedb.org/3/movie/$idt/videos?api_key=5b81a5691687fb4b7827318805cd5e10"));
      var jsonData = jsonDecode(response.body);
      var youtubeId = jsonData['results'][0]['key'];
      print(jsonData['results'][0]['key']);
      return youtubeId.toString();
    } catch (error, stacktrace) {
      throw Exception(
          'Exception occoured: $error with stacktrace: $stacktrace');
    }
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: ()async{
            String trailerId = await getLink(widget.id);
            print('url is');
            print(trailerId);
            Navigator.push(context,
                MaterialPageRoute(builder: (context)=>WatchTrailer(id:trailerId ),

                ));
          },
          child: Container(
            child: Column(
              children:<Widget> [
                // Text(widget.title),
                Container(
                  width: 320,
                  height: 310,
                  // padding: EdgeInsets.all(10),
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(8.0),
                      topRight: Radius.circular(8.0),
                    ),
                    child: Image.network(
                      'http://image.tmdb.org/t/p/w500'+widget.posterPath.toString(),
                      width: 280,
                    ),
                  ),
                ),
                // Text(widget.id.toString()),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class WatchTrailer extends StatefulWidget {
  String id;
  WatchTrailer({required this.id}) ;

  @override
  _WatchTrailerState createState() => _WatchTrailerState();
}

class _WatchTrailerState extends State<WatchTrailer> {
  @override
  Widget build(BuildContext context) {
    YoutubePlayerController _controller = YoutubePlayerController (
      initialVideoId: widget.id,
      flags: YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
      ),
    );
    return YoutubePlayer(
      controller: _controller,
    );
  }
}
class HollywoodTile extends StatefulWidget {
  final String title;
  final String? posterPath;
  final int id;
  HollywoodTile({required this.id, required this.posterPath, required this.title});

  @override
  _HollywoodTileState createState() => _HollywoodTileState();
}

class _HollywoodTileState extends State<HollywoodTile> {
  @override
  Future<String> getLink(int id) async{
    try {
      String idt = id.toString();
      var response = await http.get(Uri.parse("https://api.themoviedb.org/3/movie/$idt/videos?api_key=5b81a5691687fb4b7827318805cd5e10"));
      var jsonData = jsonDecode(response.body);
      var youtubeId = jsonData['results'][0]['key'];
      print(jsonData['results'][0]['key']);
      return youtubeId.toString();
    } catch (error, stacktrace) {
      throw Exception(
          'Exception occoured: $error with stacktrace: $stacktrace');
    }
  }
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: ()async{
            String trailerId = await getLink(widget.id);
            print('url is');
            print(trailerId);
            Navigator.push(context,
                MaterialPageRoute(builder: (context)=>WatchTrailer(id:trailerId ),

                ));
          },
          child: Container(
            child: Column(
              children:<Widget> [
                Container(
                  // color: Colors.purpleAccent,
                  width: 320,
                  height: 310,
                  // padding: EdgeInsets.all(10),
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(8.0),
                      topRight: Radius.circular(8.0),
                    ),
                    child: Image.network(
                      'http://image.tmdb.org/t/p/w500'+widget.posterPath.toString() ,
                      width: 360,
                    ),
                  ),
                ),
                // Text(widget.id.toString()),
              ],
            ),
          ),
        ),
      ],

    );
  }
}

