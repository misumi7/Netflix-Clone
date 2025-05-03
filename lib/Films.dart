import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix_clone/HomeScreen.dart';

import 'MovieCard.dart';

class FilmsSeriesScreen extends StatefulWidget{
  const FilmsSeriesScreen({super.key, required this.title});

  final String title;

  @override
  State<FilmsSeriesScreen> createState() => _FilmsSeriesScreenState();
}

class _FilmsSeriesScreenState extends State<FilmsSeriesScreen>{
  int currentMovieIndex = -1;
  final TextEditingController myController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    final List<String> posters = [];
    for (int i = 0; i < 59; ++i){
      posters.add("assets/images/home_screen/posters/poster_${i}.jpg");
    }
    return Stack(
      children: [
        Container(
          width: screenWidth * 0.93,
          alignment: Alignment.topLeft,
          color: Colors.black,
          child: SingleChildScrollView(
            child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        color: Colors.black,
                        padding: EdgeInsets.only(
                          top: screenHeight * 0.013,
                          bottom: screenHeight * 0.001,
                        ),
                        child: Text(
                          widget.title[0],
                          style: TextStyle(
                            color: Color.fromRGBO(218, 0, 0, 1.0),
                            decoration: TextDecoration.none,
                            fontSize: screenWidth * 0.051,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'BebasNeue',
                          ),
                        ),
                      ),
                      Container(
                        color: Colors.black,
                        padding: EdgeInsets.only(
                          top: screenHeight * 0.013,
                        ),
                        child: Text(
                          widget.title.substring(1),
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.85),
                            decoration: TextDecoration.none,
                            fontSize: screenWidth * 0.05,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'BebasNeue',
                          ),
                        ),
                      ),
                      SizedBox(
                        width: screenWidth * 0.02,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: screenHeight * 0.0045,
                        ),
                        child: Stack(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width * 0.32,
                              height: MediaQuery.of(context).size.height * 0.063,
                              decoration: BoxDecoration(
                                color: Color.fromRGBO(9, 9, 9, 1.0),
                                border: Border.all(
                                  color: Color.fromRGBO(66, 66, 66, 1.0),
                                  width: MediaQuery.of(context).size.height * 0.001,
                                ),
                              ),
                              child: Material(
                                color: Colors.transparent,
                                child: TextField(
                                  maxLength: 65,
                                  cursorColor: Color.fromRGBO(175, 175, 175, 1.0),
                                  textAlignVertical: TextAlignVertical.center,
                                  style: TextStyle(
                                    color: Color.fromRGBO(217, 217, 217, 1.0),
                                    fontSize: MediaQuery.of(context).size.height * 0.024,
                                  ),
                                  decoration: InputDecoration(
                                    counterText: '',
                                    hintText: "Search ",
                                    hintStyle: TextStyle(
                                      color: Color.fromRGBO(
                                          211, 211, 211, 0.15),
                                      fontSize: MediaQuery.of(context).size.height * 0.024,
                                    ),
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.only(
                                      bottom: MediaQuery.of(context).size.height * 0.0185,
                                      left: MediaQuery.of(context).size.width * 0.01,
                                    ),
                                  ),
                                  controller: myController,
                                ),
                              ),
                            ),
                            Positioned(
                              right: MediaQuery.of(context).size.width * 0.0025,
                              top: 0,
                              bottom: 0,
                              child: IconButton(
                                color: Color.fromRGBO(63, 63, 63, 1.0),
                                onPressed: () {
                                  String searchText = myController.text;
                                  print("Searching for: $searchText");
                                },
                                icon: Icon(Icons.search),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  MovieSlider(
                      movieList: widget.title == "Films" ? posters.sublist(0, 10) : posters.sublist(49, 59),
                      itemSize: screenWidth * 0.24,
                      scrollSpeed: 0.2,
                      isScrolling: true,
                      onMovieTap: (index) {
                        setState(() {
                          currentMovieIndex = index;
                        });
                      },
                  ),
                  MovieSlider(
                      movieList: widget.title == "Films" ? posters.sublist(10, 21) :posters.sublist(39, 49),
                      itemSize: screenWidth * 0.15,
                      scrollSpeed: 0.265,
                      isScrolling: true,
                      onMovieTap: (index) {
                        setState(() {
                          currentMovieIndex = index;
                        });
                      },
                  ),
                  MovieSlider(
                      movieList: widget.title == "Films" ? posters.sublist(21, 31) : posters.sublist(29, 39),
                      itemSize: screenWidth * 0.24,
                      isScrolling: true,
                      scrollSpeed: 0.2,
                      onMovieTap: (index) {
                        setState(() {
                          currentMovieIndex = index;
                        });
                      }
                  ),
                  MovieSlider(
                      movieList: widget.title == "Films" ? posters.sublist(31, 41) : posters.sublist(19, 29),
                      itemSize: screenWidth * 0.15,
                      isScrolling: true,
                      scrollSpeed: 0.265,
                      onMovieTap: (index) {
                        setState(() {
                          currentMovieIndex = index;
                        });
                      }
                  ),
                  MovieSlider(
                      movieList: widget.title == "Films" ? posters.sublist(41, 51) : posters.sublist(9, 19),
                      itemSize: screenWidth * 0.24,
                      isScrolling: true,
                      scrollSpeed: 0.2,
                      onMovieTap: (index) {
                        setState(() {
                          currentMovieIndex = index;
                        });
                      }
                  ),
                  MovieSlider(
                      movieList: widget.title == "Films" ? posters.sublist(49, 59) : posters.sublist(0, 9),
                      itemSize: screenWidth * 0.15,
                      isScrolling: true,
                      scrollSpeed: 0.265,
                      onMovieTap: (index) {
                        setState(() {
                          currentMovieIndex = index;
                        });
                      }
                  ),
                ]
            ),
          ),
        ),
        if(currentMovieIndex != -1)
          MovieCard(
            posterPath: posters[currentMovieIndex],
            description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
            onClose: () {
              setState(() {
                currentMovieIndex = -1;
              });
            },
          ),
      ],
    );
  }
}