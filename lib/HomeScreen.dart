import 'dart:async';
import 'dart:io';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'MovieCard.dart';
import 'MovieSlider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>{
  late Timer timer;
  int currentBannerIndex = 0;
  int currentMovieIndex = -1;
  int movieSliderIndex = -1;
  final List<Banner> banners = [
    Banner(
      key: ValueKey(0),
      bannerPath: 'assets/images/home_screen/banners/witcher_banner.jpg',
      logoPath: 'assets/images/home_screen/logos/witcher_logo.png',
      logoSize: 0.17,
      title: 'The Witcher',
      rating: ' 8.2 / 10',
      titleTopPadding: 0.01,
    ),
    Banner(
      key: ValueKey(1),
      bannerPath: 'assets/images/home_screen/banners/sopranos_banner.jpg',
      logoPath: 'assets/images/home_screen/logos/sopranos_logo.png',
      logoSize: 0.22,
      title: '',
      rating: ' 9.4 / 10',
      titleTopPadding: 0,
    ),
    Banner(
      key: ValueKey(2),
      bannerPath: 'assets/images/home_screen/banners/housemd_banner.jpg',
      logoPath: 'assets/images/home_screen/logos/housemd_logo.png',
      logoSize: 0.22,
      title: 'House, M.D.',
      rating: ' 9.6 / 10',
      titleTopPadding: 0.27,
    ),
  ];

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(const Duration(seconds: 10), (Timer t) {
      setState(() {
        currentBannerIndex = (currentBannerIndex + 1) % banners.length;
      });
    });
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    final List<String> posters = [];
    for (int i = 0; i < 59; ++i){
      posters.add("assets/images/home_screen/posters/poster_${i}.jpg");
    }

    List<List<String>> movieSliderPosters = [
      posters.sublist(0, 15),
      posters.sublist(15, 30),
      posters.sublist(30, 45),
      posters.sublist(45, 59),
      posters.sublist(38, 42) + posters.sublist(21, 25) + posters.sublist(7, 12)
    ];

    return Container(
        width: kIsWeb ? screenWidth * 0.93 : screenWidth,
        height: kIsWeb ? screenHeight : screenHeight * 0.93,
        child: Stack(
          children: [
            SizedBox(
              width: kIsWeb ? screenWidth * 0.93 : screenWidth,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    AnimatedSwitcher(
                      duration: Duration(milliseconds: 500),
                      switchInCurve: Curves.easeIn,
                      switchOutCurve: Curves.easeOut,
                      transitionBuilder: (Widget child, Animation<double> animation) {
                        return FadeTransition(opacity: animation, child: child);
                      },
                      child: banners[currentBannerIndex],
                    ),

                    Container(
                      width: screenWidth,
                      color: Colors.black,
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: screenWidth * 0.008,
                        ),
                        child: Text(
                          "Because you watched House of Cards",
                          style: TextStyle(
                            color: Color.fromRGBO(227, 227, 227, 1.0),
                            fontSize: kIsWeb ? screenWidth * 0.017 : screenHeight * 0.018,
                            fontFamily: "Calibri",
                            fontWeight: FontWeight.w800,
                            decoration: TextDecoration.none,
                          ),
                        ),
                      ),
                    ),
                    MovieSlider(
                      itemSize: kIsWeb ? screenWidth * 0.1 : screenHeight * 0.155,
                      movieList: movieSliderPosters[0],
                      onMovieTap: (int index) {
                        setState(() {
                          currentMovieIndex = index;
                          movieSliderIndex = 0;
                        });
                      },
                      isScrolling: false,
                    ),
                    Container(
                      width: screenWidth,
                      color: Colors.black,
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: screenWidth * 0.008,
                          top: screenHeight * 0.016,
                        ),
                        child: Text(
                          "Popular on Netflex",
                          style: TextStyle(
                            color: Color.fromRGBO(227, 227, 227, 1.0),
                            fontSize: kIsWeb ? screenWidth * 0.017 : screenHeight * 0.018,
                            fontFamily: "Calibri",
                            fontWeight: FontWeight.w800,
                            decoration: TextDecoration.none,
                          ),
                        ),
                      ),
                    ),
                    MovieSlider(
                      itemSize: kIsWeb ? screenWidth * 0.1 : screenHeight * 0.155,
                      movieList: movieSliderPosters[1],
                      onMovieTap: (int index) {
                        setState(() {
                          currentMovieIndex = index;
                          movieSliderIndex = 1;
                        });
                      },
                      isScrolling: false,
                    ),
                    Container(
                      width: screenWidth,
                      color: Colors.black,
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: screenWidth * 0.008,
                          top: screenHeight * 0.016,
                        ),
                        child: Text(
                          "Trending Now",
                          style: TextStyle(
                            color: Color.fromRGBO(227, 227, 227, 1.0),
                            fontSize: kIsWeb ? screenWidth * 0.017 : screenHeight * 0.018,
                            fontFamily: "Calibri",
                            fontWeight: FontWeight.w800,
                            decoration: TextDecoration.none,
                          ),
                        ),
                      ),
                    ),
                    MovieSlider(
                      itemSize: kIsWeb ? screenWidth * 0.1 : screenHeight * 0.155,
                      movieList: movieSliderPosters[2],
                      onMovieTap: (int index) {
                        setState(() {
                          currentMovieIndex = index;
                          movieSliderIndex = 2;
                        });
                      },
                      isScrolling: false,
                    ),
                    Container(
                      width: screenWidth,
                      color: Colors.black,
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: screenWidth * 0.008,
                          top: screenHeight * 0.016,
                        ),
                        child: Text(
                          "New this week",
                          style: TextStyle(
                            color: Color.fromRGBO(227, 227, 227, 1.0),
                            fontSize: kIsWeb ? screenWidth * 0.017 : screenHeight * 0.018,
                            fontFamily: "Calibri",
                            fontWeight: FontWeight.w800,
                            decoration: TextDecoration.none,
                          ),
                        ),
                      ),
                    ),
                    MovieSlider(
                      itemSize: kIsWeb ? screenWidth * 0.1 : screenHeight * 0.155,
                      movieList: movieSliderPosters[3],
                      onMovieTap: (int index) {
                        setState(() {
                          currentMovieIndex = index;
                          movieSliderIndex = 3;
                        });
                      },
                      isScrolling: false,
                    ),

                    Container(
                      width: screenWidth,
                      color: Colors.black,
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: screenWidth * 0.008,
                          top: screenHeight * 0.016,
                        ),
                        child: Text(
                          "Only on Netflex",
                          style: TextStyle(
                            color: Color.fromRGBO(227, 227, 227, 1.0),
                            fontSize: kIsWeb ? screenWidth * 0.017 : screenHeight * 0.018,
                            fontFamily: "Calibri",
                            fontWeight: FontWeight.w800,
                            decoration: TextDecoration.none,
                          ),
                        ),
                      ),
                    ),
                    MovieSlider(
                      itemSize: kIsWeb ? screenWidth * 0.18 : screenHeight * 0.25,
                      movieList: movieSliderPosters[4],
                      format: 1,
                      onMovieTap: (int index) {
                        setState(() {
                          currentMovieIndex = index;
                          movieSliderIndex = 4;
                        });
                      },
                      isScrolling: false,
                    ),

                    // Final padding
                    SizedBox(
                      width: screenWidth,
                      height: screenHeight * 0.03,
                    ),
                  ],
                ),
              ),
            ),
            if (currentMovieIndex != -1)
              MovieCard(
                posterPath: movieSliderPosters[movieSliderIndex][currentMovieIndex],
                description: "Forty years after his unforgettable first case in Beverly Hills, Detroit cop Axel Foley returns to do what he does best: solve crimes and cause chaos.",
                onClose: () {
                  setState(() {
                    currentMovieIndex = -1;
                    movieSliderIndex = -1;
                  });
                },
              ),
          ],
        ),
    );
  }
}

class Banner extends StatelessWidget{
  const Banner({super.key, required this.titleTopPadding, required this.logoPath, required this.bannerPath, required this.logoSize, required this.title, required this.rating});

  final String bannerPath;
  final String logoPath;
  final double logoSize;
  final String title;
  final String rating;
  final double titleTopPadding;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return kIsWeb ?
      Stack(
        children: [
          Image.asset(
            bannerPath,
            width: screenWidth,
            fit: BoxFit.cover,
            alignment: Alignment.topCenter,
          ),

          // Shadows
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: 80,
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.black54, Colors.transparent],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: -1,
            left: 0,
            right: 0,
            height: 80,
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  stops: [0.0, 0.05, 1.0],
                  colors: [Colors.black, Colors.black, Colors.transparent],
                ),
              ),
            ),
          ),
          Positioned(
            left: 0,
            top: 0,
            bottom: 0,
            width: 80,
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [Colors.black87, Colors.transparent],
                ),
              ),
            ),
          ),
          Positioned(
            right: 0,
            top: 0,
            bottom: 0,
            width: 80,
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.centerRight,
                  end: Alignment.centerLeft,
                  colors: [Colors.black87, Colors.transparent],
                ),
              ),
            ),
          ),

          // Title and Description
          // Tried to use a Row but a pixel line is dividing 2 containers
          // Try to fix later
          Positioned(
            left: -1,
            bottom: 0,
            top: 0,
            child: Stack(
              children: [
                Container(
                  width: screenWidth * 0.29,
                  decoration: const BoxDecoration(
                    color: Colors.black,
                  ),
                ),
                Container(
                  alignment: Alignment(-0.28, 0.35),
                  width: screenWidth * 0.31,
                  height: screenHeight * 0.52,
                  // color: Colors.red,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Opacity(
                        opacity: title.isNotEmpty ? 0.7 : 0.9,
                        child: Image.asset(
                          logoPath,
                          width: screenWidth * logoSize,
                          height: screenWidth * logoSize,
                          fit: BoxFit.fitWidth,
                          alignment: Alignment.center,
                        ),
                      ),
                      if(title.isNotEmpty)
                        Container(
                          padding: EdgeInsets.only(
                            top: screenHeight * titleTopPadding,
                          ),
                          child: Text.rich(
                            softWrap: true,
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: title[0].toUpperCase(),
                                  style: TextStyle(
                                    color: Colors.red,
                                    fontFamily: "BebasNeue",
                                    fontSize: screenWidth * 0.05,
                                    fontWeight: FontWeight.w700,
                                    decoration: TextDecoration.none,
                                    shadows: [
                                      Shadow(
                                        blurRadius: 10.0,
                                        color: Colors.black,
                                        offset: Offset(5.0, 5.0),
                                      ),
                                    ],
                                  ),
                                ),
                                TextSpan(
                                  text: title.substring(1).toUpperCase(),
                                  style: TextStyle(
                                    fontFamily: "BebasNeue",
                                    color: Color.fromRGBO(
                                        227, 227, 227, 1.0),
                                    fontSize: screenWidth * 0.05,
                                    fontWeight: FontWeight.w500,
                                    decoration: TextDecoration.none,
                                    shadows: [
                                      Shadow(
                                        blurRadius: 10.0,
                                        color: Colors.black,
                                        offset: Offset(5.0, 5.0),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
                Positioned(
                  bottom: screenHeight * 0.125,
                  left: screenWidth * 0.018,
                  child: Row(
                    children: [
                      Icon(
                        Icons.star_rate,
                        color: Colors.white,
                        size: screenWidth * 0.02,
                      ),
                      Text(
                        rating,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: screenWidth * 0.018,
                          fontWeight: FontWeight.w500,
                          decoration: TextDecoration.none,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            left: screenWidth * 0.29 - 2,
            top: 0,
            bottom: 0,
            child: Container(
              width: screenWidth * 0.2,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  stops: [0.0, 0.05, 1.0],
                  colors: [Colors.black, Colors.black, Colors.transparent],
                ),
              ),
            ),
          ),

          // Buttons
          Positioned(
            bottom: screenHeight * 0.05,
            left: screenWidth * 0.018,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                HoverButton(
                  color: const Color.fromRGBO(169, 13, 13, 1.0),
                  textColor: Colors.white,
                  text: "Play",
                ),
                SizedBox(width: screenWidth * 0.01),
                HoverButton(
                  color: const Color.fromRGBO(227, 227, 227, 1.0),
                  textColor: Colors.black,
                  text: "Watch Trailer",
                ),
              ],
            ),
          )
        ],
      )
    : // -------------------------------------------------------
      Stack(
        children: [
          Image.asset(
            bannerPath,
            width: screenWidth,
            height: screenHeight * 0.45,
            fit: BoxFit.cover,
            alignment: Alignment(-0.165, 0),
          ),
          Container(
            color: Colors.black.withOpacity(0.25),
            width: screenWidth,
            height: screenHeight * 0.45,
          ),

          // Shadows
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: 80,
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.black54, Colors.transparent],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: -1,
            left: 0,
            right: 0,
            height: 80,
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  stops: [0.0, 0.05, 1.0],
                  colors: [Colors.black, Colors.black, Colors.transparent],
                ),
              ),
            ),
          ),
          Positioned(
            left: 0,
            top: 0,
            bottom: 0,
            width: 80,
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [Colors.black87, Colors.transparent],
                ),
              ),
            ),
          ),
          Positioned(
            right: 0,
            top: 0,
            bottom: 0,
            width: 80,
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.centerRight,
                  end: Alignment.centerLeft,
                  colors: [Colors.black87, Colors.transparent],
                ),
              ),
            ),
          ),

          Container(
            height: screenHeight * 0.4,
            width: screenWidth,
            alignment: Alignment.center,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Opacity(
                  opacity: 0.9,
                  child: Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 20,
                          offset: Offset(0, 0),
                        ),
                      ],
                    ),
                    child: Image.asset(
                      logoPath,
                      width: screenWidth * logoSize * 3.5,
                      height: screenWidth * logoSize * 3.5,
                      fit: BoxFit.fitWidth,
                      alignment: Alignment.center,
                    ),
                  ),
                ),
                if(title.isNotEmpty)
                  Container(
                    padding: EdgeInsets.only(
                      top: screenHeight * titleTopPadding,
                    ),
                    child: Text.rich(
                      softWrap: true,
                      TextSpan(
                        children: [
                          TextSpan(
                            text: title[0].toUpperCase(),
                            style: TextStyle(
                              color: Colors.red,
                              fontFamily: "BebasNeue",
                              fontSize: screenHeight * 0.078,
                              fontWeight: FontWeight.w700,
                              decoration: TextDecoration.none,
                              shadows: [
                                Shadow(
                                  blurRadius: 10.0,
                                  color: Colors.black,
                                  offset: Offset(5.0, 5.0),
                                ),
                              ],
                            ),
                          ),
                          TextSpan(
                            text: title.substring(1).toUpperCase(),
                            style: TextStyle(
                              fontFamily: "BebasNeue",
                              color: Color.fromRGBO(
                                  227, 227, 227, 1.0),
                              fontSize: screenHeight * 0.078,
                              fontWeight: FontWeight.w500,
                              decoration: TextDecoration.none,
                              shadows: [
                                Shadow(
                                  blurRadius: 10.0,
                                  color: Colors.black,
                                  offset: Offset(5.0, 5.0),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
              ],
            ),
          ),

          // Title and Description
          // Tried to use a Row but a pixel line is dividing 2 containers
          // Try to fix later

          // Buttons
          Container(
            padding: EdgeInsets.only(
              top: screenHeight * 0.375,
            ),
            alignment: Alignment.bottomCenter,
            child: HoverButton(
              color: const Color.fromRGBO(224, 224, 224, 0.75),
              textColor: Colors.black,
              text: "Watch Now",
            ),
          )
        ],
      );
  }
}

class HoverButton extends StatefulWidget{
  const HoverButton({super.key, required this.color, required this.textColor, required this.text});
  final String text;
  final Color color;
  final Color textColor;

  @override
  State<HoverButton> createState() => _HoverButtonState();
}

class _HoverButtonState extends State<HoverButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    EdgeInsets padding = EdgeInsets.symmetric(horizontal: screenWidth * 0.03, vertical: screenHeight * 0.015);

    return FittedBox(
      child: MouseRegion(
        onEnter: (_) => setState(() => _isHovered = true),
        onExit: (_) => setState(() => _isHovered = false),
        child: GestureDetector(
          onTap: () {
            print("Button tapped");
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 100),
            padding: padding,
            decoration: BoxDecoration(
              color: _isHovered ? widget.color.withOpacity(0.85) : widget.color,
              borderRadius: BorderRadius.circular(kIsWeb ? 35 : screenHeight * 0.02),
            ),
            child: Text(
              widget.text,
              style: TextStyle(
                color: widget.textColor,
                fontSize: kIsWeb ? screenWidth * 0.012 : screenHeight * 0.025,
                fontWeight: FontWeight.w400,
                decoration: TextDecoration.none,
                fontFamily: "Calibri"
              ),
            ),
          ),
        ),
      ),
    );
  }
}