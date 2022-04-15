import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
class WatchTrailer extends StatefulWidget {
  final trailerId;
  const WatchTrailer({required this.trailerId});

  @override
  _WatchTrailerState createState() => _WatchTrailerState();
}

class _WatchTrailerState extends State<WatchTrailer> {

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      width: 400,

    );
  }
}
