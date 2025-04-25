import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'LeftSideMenu.dart';
import 'MainScreen.dart';

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
  @override
  Widget build(BuildContext context) {
    // debugPaintSizeEnabled = true;
    return Container(
      color: Colors.black,
      child: Row(
        children: [
            LeftSideMenu(),
            MainScreen(),
          ],
      ),
    );
  }
}
