import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:netflix_clone/HomeScreen.dart';

import 'MovieCard.dart';

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

    return Stack(
      children:[
        Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: screenHeight * 0.2,
              ),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.93,
                color: Colors.black,
                child: Align(
                  alignment: Alignment(0.0, -0.65),
                  child: Stack(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.6,
                        height: MediaQuery.of(context).size.height * 0.063,
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(19, 19, 19, 1.0),
                          borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width * 0.02),
                          border: Border.all(
                            color: Color.fromRGBO(33, 33, 33, 1.0),
                            width: MediaQuery.of(context).size.width * 0.002,
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
                                hintText: "Search for a movie, series or genre",
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
                        right: MediaQuery.of(context).size.width * 0.005,
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
              height: MediaQuery.of(context).size.height * 0.2,
              width: MediaQuery.of(context).size.width * 0.93,
            ),
            Container(
              width: screenWidth * 0.93,
              color: Colors.black,
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  "You might be interested in",
                  style: TextStyle(
                    color: Color.fromRGBO(227, 227, 227, 1.0),
                    fontSize: kIsWeb ? screenWidth * 0.017 : screenHeight * 0.025,
                    fontWeight: FontWeight.w800,
                    decoration: TextDecoration.none,
                  ),
                ),
              ),
            ),
            SizedBox(
              width: screenWidth * 0.93,
              child: MovieSlider(
                  movieList: posters,
                  itemSize: kIsWeb ? screenWidth * 0.25 : screenHeight * 0.5,
                  onMovieTap: (index) {
                    setState(() {
                      currentMovieIndex = index;
                    });
                  },
                  isScrolling: false,
              ),
            ),
          ],
        ),
        if (currentMovieIndex != -1)
          Container(
            padding: EdgeInsets.only(
              top: screenHeight * 0.018,
              bottom: screenHeight * 0.017,
            ),
            color: Color.fromRGBO(0, 0, 0, 0.5),
            width: screenWidth * 0.93,
            height: screenHeight,
            child: Center(
              child: Container(
                width: screenWidth * 0.5,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(26, 26, 26, 1.0),
                  borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width * 0.01),
                ),
                child: MovieCard(
                  posterPath: posters[currentMovieIndex],
                  description: "Forty years after his unforgettable first case in Beverly Hills, Detroit cop Axel Foley returns to do what he does best: solve crimes and cause chaos.",
                  onClose: () {
                    setState(() {
                      currentMovieIndex = -1;
                    });
                  },
                ),
              ),
            ),
          ),
      ],
    );
  }
}