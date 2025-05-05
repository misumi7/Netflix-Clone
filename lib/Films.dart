import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'MovieCard.dart';
import 'MovieSlider.dart';

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
          height: kIsWeb ? screenHeight : screenHeight * 0.93,
          alignment: Alignment.topLeft,
          color: Colors.black,
          child: SingleChildScrollView(
            child: Column(
                children: [
                  if (!kIsWeb)
                    SizedBox(
                      height: screenHeight * 0.015,
                    ),
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
                            fontSize: kIsWeb ? screenWidth * 0.061 : screenHeight * 0.061,
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
                            fontSize: kIsWeb ? screenWidth * 0.06 : screenHeight * 0.06,
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
                          top: screenHeight * 0.01,
                          left: kIsWeb ? 0 : screenHeight * 0.01,
                        ),
                        child: Stack(
                          children: [
                            Container(
                              width: kIsWeb ? MediaQuery.of(context).size.width * 0.32 : MediaQuery.of(context).size.height * 0.19,
                              height: kIsWeb ? MediaQuery.of(context).size.height * 0.063 : MediaQuery.of(context).size.width * 0.063,
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
                                    fontSize: kIsWeb ? MediaQuery.of(context).size.height * 0.024 : MediaQuery.of(context).size.width * 0.034,
                                  ),
                                  decoration: InputDecoration(
                                    counterText: '',
                                    hintText: "Search ",
                                    hintStyle: TextStyle(
                                      color: Color.fromRGBO(
                                          211, 211, 211, 0.15),
                                      fontSize: kIsWeb ? MediaQuery.of(context).size.height * 0.024 : MediaQuery.of(context).size.width * 0.034,
                                    ),
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.only(
                                      bottom: kIsWeb ? MediaQuery.of(context).size.height * 0.0185 : MediaQuery.of(context).size.width * 0.023,
                                      left: MediaQuery.of(context).size.width * 0.01,
                                    ),
                                  ),
                                  controller: myController,
                                ),
                              ),
                            ),
                            if (kIsWeb)
                              Positioned(
                                right: MediaQuery.of(context).size.width * 0.0035,
                                top: 0,
                                bottom: 0,
                                child: IconButton(
                                  color: Color.fromRGBO(63, 63, 63, 1.0),
                                  onPressed: () {
                                    String searchText = myController.text;
                                    print("Searching for: $searchText");
                                  },
                                  icon: Icon(
                                    Icons.search,
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  MovieSlider(
                      movieList: widget.title == "Films" ? posters.sublist(0, 10) : posters.sublist(49, 59),
                      itemSize: kIsWeb ? screenWidth * 0.2 : screenHeight * 0.28,
                      itemHeight: kIsWeb ? screenWidth * 0.25 : screenHeight * 0.26,
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
                      itemSize: kIsWeb ? screenWidth * 0.11 : screenHeight * 0.13,
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
                      itemSize: kIsWeb ? screenWidth * 0.2 : screenHeight * 0.25,
                      itemHeight: kIsWeb ? screenWidth * 0.22 : screenHeight * 0.27,
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
                      itemSize: kIsWeb ? screenWidth * 0.15 : screenHeight * 0.2,
                      itemHeight: kIsWeb ? screenWidth * 0.2 : screenHeight * 0.25,
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
                      itemSize: kIsWeb ? screenWidth * 0.2 : screenHeight * 0.25,
                      itemHeight: kIsWeb ? screenWidth * 0.28 : screenHeight * 0.33,
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
                      itemSize: kIsWeb ? screenWidth * 0.11 : screenHeight * 0.15,
                      isScrolling: true,
                      scrollSpeed: 0.23,
                      onMovieTap: (index) {
                        setState(() {
                          currentMovieIndex = index;
                        });
                      }
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.009,
                    width: MediaQuery.of(context).size.width * 0.93,
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