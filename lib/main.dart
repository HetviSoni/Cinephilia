import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cinephilia/screens/home_screen.dart';
// import 'package:cinephilia/screens/test.dart';
import 'screens/tab.dart';
import 'api/api.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Cinephilia',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TabScreen(),


    );
  }
}
