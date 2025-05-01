import 'dart:async';
import 'dart:io';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'MovieCard.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>{
  late Timer timer;
  int currentBannerIndex = 0;
  int currentMovieIndex = -1;
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

  // REMOVE WHEN MY LIST
  bool _isInMyList = false;

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

    return Stack(
        children: [
          SizedBox(
            width: screenWidth * 0.93,
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
                          fontSize: screenWidth * 0.017,
                          fontWeight: FontWeight.w800,
                          decoration: TextDecoration.none,
                        ),
                      ),
                    ),
                  ),
                  MovieSlider(
                    itemSize: (MediaQuery.of(context).size.width * 0.1).roundToDouble(),
                    movieList: posters.sublist(0, 15),
                    onMovieTap: (int index) {
                      setState(() {
                        currentMovieIndex = index;
                      });
                    },
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
                          fontSize: screenWidth * 0.017,
                          fontWeight: FontWeight.w800,
                          decoration: TextDecoration.none,
                        ),
                      ),
                    ),
                  ),
                  MovieSlider(
                    itemSize: (MediaQuery.of(context).size.width * 0.1).roundToDouble(),
                    movieList: posters.sublist(15, 30),
                    onMovieTap: (int index) {
                      setState(() {
                        currentMovieIndex = index;
                      });
                    },
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
                          fontSize: screenWidth * 0.017,
                          fontWeight: FontWeight.w800,
                          decoration: TextDecoration.none,
                        ),
                      ),
                    ),
                  ),
                  MovieSlider(
                    itemSize: (MediaQuery.of(context).size.width * 0.1).roundToDouble(),
                    movieList: posters.sublist(30, 45),
                    onMovieTap: (int index) {
                      setState(() {
                        currentMovieIndex = index;
                      });
                    },
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
                          fontSize: screenWidth * 0.017,
                          fontWeight: FontWeight.w800,
                          decoration: TextDecoration.none,
                        ),
                      ),
                    ),
                  ),
                  MovieSlider(
                    itemSize: (MediaQuery.of(context).size.width * 0.1).roundToDouble(),
                    movieList: posters.sublist(45, 59),
                    onMovieTap: (int index) {
                      setState(() {
                        currentMovieIndex = index;
                      });
                    },
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
              posterPath: posters[currentMovieIndex],
              description: "Forty years after his unforgettable first case in Beverly Hills, Detroit cop Axel Foley returns to do what he does best: solve crimes and cause chaos.",
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

class MovieSlider extends StatefulWidget {
  const MovieSlider({super.key, required this.movieList, required this.itemSize, required this.onMovieTap});

  final List<String> movieList;
  final double itemSize;
  final Function(int) onMovieTap;

  @override
  State<MovieSlider> createState() => _MovieSliderState();
}

class _MovieSliderState extends State<MovieSlider> {
  final ScrollController _scrollController = ScrollController();
  bool _isAnimating = false;

  void _scrollRight() async{
    double itemsLeft = (_scrollController.position.maxScrollExtent - _scrollController.offset) / widget.itemSize;
    print("Right: $itemsLeft\n");
    if (!_isAnimating) {
      //print(itemsLeft);
      setState(() {
        _isAnimating = true;
      });
      await _scrollController.animateTo(_scrollController.offset + (widget.itemSize) * min(3, itemsLeft),
          duration: Duration(milliseconds: 200), curve: Curves.ease);
      setState(() {
        _isAnimating = false;
      });
    }
  }

  void _scrollLeft() async{
    double itemsLeft = (_scrollController.offset - _scrollController.position.minScrollExtent) / widget.itemSize;
    print("Left: $itemsLeft\n");
    if (!_isAnimating) {
      setState(() {
        _isAnimating = true;
      });
      await _scrollController.animateTo(_scrollController.offset - widget.itemSize * min(3, itemsLeft),
          duration: Duration(milliseconds: 200), curve: Curves.ease);
      setState(() {
        _isAnimating = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: (MediaQuery.of(context).size.height * 0.32).roundToDouble(),
      child: Stack(
        children: [
          ScrollConfiguration(
            behavior: NoScrollBehaviour(),
            child: ListView.builder(
                controller: _scrollController,
                scrollDirection: Axis.horizontal,
                itemCount: widget.movieList.length,
                itemBuilder: (context, index) {
                  return Container(
                    color: Colors.black,
                    width: widget.itemSize,
                    child: Padding(
                      padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.005,
                        bottom: MediaQuery.of(context).size.height * 0.005,
                        left: MediaQuery.of(context).size.width * 0.001,
                        right: MediaQuery.of(context).size.width * 0.001,
                      ),
                      child: GestureDetector(
                        onTap: () {
                          widget.onMovieTap(index);
                        },
                        child: Image.asset(
                          widget.movieList[index],
                          fit: BoxFit.cover,
                          alignment: Alignment.center,
                        ),
                      ),
                    ),
                  );
                }
            ),
          ),
          Positioned(
            left: 0,
            top: 0,
            bottom: 0,
            width: MediaQuery.of(context).size.width * 0.04,
            child: Container(
              color: Colors.transparent,
              child: IconButton(
                onPressed: _scrollLeft,
                icon: Icon(
                  Icons.chevron_left_rounded,
                  color: Colors.white70,
                ),
                style: ButtonStyle(
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(borderRadius: BorderRadius.zero),
                  ),
                ),
                highlightColor: Colors.black.withOpacity(0.25),
              ),
            ),
          ),
          Positioned(
            right: 0,
            top: 0,
            bottom: 0,
            width: MediaQuery.of(context).size.width * 0.04,
            child: Container(
              color: Colors.transparent,
              child: IconButton(
                onPressed: _scrollRight,
                icon: Icon(
                  Icons.chevron_right_rounded,
                  color: Colors.white70,
                ),
                style: ButtonStyle(
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(borderRadius: BorderRadius.zero),
                  ),
                ),
                highlightColor: Colors.black.withOpacity(0.25),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class NoScrollBehaviour extends ScrollBehavior {
  @override
  Widget buildViewportChrome(BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }

  @override
  Widget buildScrollbar(BuildContext context, Widget child, ScrollableDetails details) {
    return child; // без скроллбара
  }

  @override
  ScrollPhysics getScrollPhysics(BuildContext context) {
    return const NeverScrollableScrollPhysics(); // turn off the scrolling
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
    return Stack(
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
              Positioned(
                bottom: screenHeight * 0.2,
                left: 0,
                right: 0,
                child: Center(
                  child: SizedBox(
                    // color: Colors.red,
                    width: screenWidth * 0.23,
                    child: Center(
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
                  ),
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
              borderRadius: BorderRadius.circular(35),
            ),
            child: Text(
              widget.text,
              style: TextStyle(
                color: widget.textColor,
                fontSize: MediaQuery.of(context).size.width * 0.012,
                fontWeight: FontWeight.w400,
                decoration: TextDecoration.none,
              ),
            ),
          ),
        ),
      ),
    );
  }
}