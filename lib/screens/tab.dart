import 'package:flutter/src/material/tabs.dart';
import 'package:flutter/material.dart';
import 'package:cinephilia/views/home.dart';
import 'package:cinephilia/views/home.dart';
import 'package:cinephilia/screens/movie_home.dart';
import 'home_screen.dart';

class TabScreen extends StatefulWidget {
  const TabScreen({Key? key}) : super(key: key);
  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState()
  {
    super.initState();
    _tabController= TabController(
        length: 3, vsync: this, initialIndex: 1
    );
  }
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Cinephilia'),
        elevation: 0.7,
        backgroundColor: Colors.green.shade800,
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Colors.white,
          tabs:  <Widget> [
            Tab(
              text: 'Trailers',
            ),
            Tab(
              text: 'Info',
            ),
            Tab(
              text: 'News',
            ),
          ],
        ),
        // actions: const [
        //   Padding(padding: EdgeInsets.symmetric(horizontal: 7),
        //   ),
        //   Icon(Icons.search),
        //   Icon(Icons.more_vert),
        //
        // ],
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          Home(),
          MovieHome(),
          NewsHome(),
        ],
      ),

    );
  }
}
