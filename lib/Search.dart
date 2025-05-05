import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'MovieCard.dart';
import 'MovieSlider.dart';

class Search extends StatefulWidget{
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  final TextEditingController myController = TextEditingController();
  int currentMovieIndex = -1;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    final List<String> posters = [];
    for (int i = 5; i < 22; ++i){
      posters.add("assets/images/home_screen/posters/poster_${i}.jpg");
    }

    return Container(
      width: kIsWeb ? screenWidth * 0.93 : screenWidth,
      height: kIsWeb ? screenHeight : screenHeight * 0.93,
      child: Stack(
        children:[
          Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  top: kIsWeb ? screenHeight * 0.2 : screenHeight * 0.23,
                ),
                child: Container(
                  width: kIsWeb ? screenWidth * 0.93 : screenWidth,
                  color: Colors.black,
                  child: Align(
                    alignment: Alignment(0.0, -0.65),
                    child: Stack(
                      children: [
                        Container(
                          width: kIsWeb ? screenWidth * 0.6 : screenWidth * 0.68,
                          height: screenHeight * 0.063,
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(19, 19, 19, 1.0),
                            borderRadius: BorderRadius.circular(screenWidth * 0.02),
                            border: Border.all(
                              color: Color.fromRGBO(33, 33, 33, 1.0),
                              width: screenWidth * 0.002,
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
                                  fontSize: screenHeight * 0.024,
                                ),
                                decoration: InputDecoration(
                                  counterText: '',
                                  hintText: kIsWeb ? "Search for a movie, series or genre" : "Search for a movie",
                                  hintStyle: TextStyle(
                                    color: Color.fromRGBO(
                                        211, 211, 211, 0.15),
                                    fontSize: screenHeight * 0.024,
                                  ),
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.only(
                                    bottom: kIsWeb ? screenHeight * 0.0185 : screenHeight * 0.008,
                                    left: kIsWeb ? screenWidth * 0.01 : screenWidth * 0.022,
                                  ),
                                ),
                                controller: myController,
                            ),
                          ),
                        ),
                        Positioned(
                          right: screenWidth * 0.005,
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
                ),
              ),
              SizedBox(
                height: kIsWeb ? screenHeight * 0.11 : screenHeight * 0.075,
                width: kIsWeb ? screenWidth * 0.93 : screenWidth,
              ),
              Container(
                width: kIsWeb ? screenWidth * 0.93 : screenWidth,
                color: Colors.black,
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    "You might be interested in",
                    style: TextStyle(
                      color: Color.fromRGBO(227, 227, 227, 1.0),
                      fontSize: kIsWeb ? screenWidth * 0.017 : screenHeight * 0.025,
                      fontWeight: FontWeight.w800,
                      fontFamily: "Calibri",
                      decoration: TextDecoration.none,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: kIsWeb ? screenWidth * 0.93 : screenWidth,
                child: MovieSlider(
                    movieList: posters,
                    isScrolling: true,
                    scrollSpeed: 0.1,
                    format: 1,
                    itemSize: kIsWeb ? screenWidth * 0.13 : screenHeight * 0.23,
                    onMovieTap: (index) {
                      setState(() {
                        currentMovieIndex = index;
                      });
                    },
                ),
              ),
            ],
          ),
          if (currentMovieIndex != -1)
            MovieCard(
                posterPath: posters[currentMovieIndex],
                description: "Forty years after his unforgettable first case in Beverly Hills, Detroit cop Axel Foley returns to do what he does best: solve crimes and cause chaos.",
                onClose: () {
                  setState(() {
                    currentMovieIndex = -1;
                  });
                },
              ),
        ],
      ),
    );
  }
}