import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:netflix_clone/MyList.dart';
import 'package:provider/provider.dart';

import 'Films.dart';
import 'HomeScreen.dart';
import 'LeftSideMenu.dart';
import 'Search.dart';
import 'TopRomania.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => MyListModel(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Netflix Clone',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  // Fields in a Widget subclass are always marked "final".

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentPageIndex = 0;
  final List<Widget> pages = [
    HomeScreen(),
    Search(),
    FilmsSeriesScreen(
      title: "Films",
    ),
    FilmsSeriesScreen(
      title: "Series",
    ),
    MyList(),
    TopRomania(),
  ];

  @override
  Widget build(BuildContext context) {
    // debugPaintSizeEnabled = true;
    return Container(
      color: Colors.black,
      child: kIsWeb ?
          Row(
            children: [
              LeftSideMenu(
                onPageSelected: (index) {
                  setState(() {
                    _currentPageIndex = index;
                  });
                },
              ),
              pages[_currentPageIndex],
            ],
          )
        :
          Column(
            children: [
              pages[_currentPageIndex],
              BottomMenu(
                currentPageIndex: _currentPageIndex,
                onPageSelected: (index) {
                  setState(() {
                  _currentPageIndex = index;
                  });
                },
              ),
            ]
          ),
    );
  }
}
