import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class movieModel{
   String? posterPath;
   late String title;
  late String originalLanguage;
  int id;
  // String trailerId;
  late String trailerLink;
  movieModel({required this.title, required this.originalLanguage, required this.posterPath, required this.id, });


}