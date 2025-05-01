import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:netflix_clone/MyList.dart';

import 'Films.dart';
import 'HomeScreen.dart';
import 'LeftSideMenu.dart';
import 'Search.dart';
import 'Series.dart';
import 'TopRomania.dart';

void main() {
  runApp(const MyApp());
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
  int _currentPageIndex = 4;
  final List<Widget> pages = [
    HomeScreen(),
    Search(),
    Films(),
    Series(),
    MyList(),
    TopRomania(),
  ];

  @override
  Widget build(BuildContext context) {
    // debugPaintSizeEnabled = true;
    return Container(
      color: Colors.black,
      child: Row(
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
      ),
    );
  }
}
