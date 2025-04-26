import 'dart:async';
import 'dart:io';
import 'dart:math';

// import 'package:faker/faker.dart' as faker;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>{
  late Timer timer;
  int currentBannerIndex = 0;
  int currentMovieIndex = 20;
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

class MovieCard extends StatefulWidget {
  const MovieCard({super.key, required this.posterPath, required this.onClose});

  final String posterPath;
  final Function() onClose;

  @override
  State<MovieCard> createState() => _MovieCardState();
}

class _MovieCardState extends State<MovieCard>{
  bool _isInMyList = false;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return SingleChildScrollView(
      child: Column(
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width * 0.01),
                child: Image.asset(
                  widget.posterPath,
                  alignment: Alignment(0.0, -0.4),
                  height: screenHeight * 0.7,
                  width: screenWidth * 0.5,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: screenHeight * 0.4 + 1,
                left: 0,
                right: 0,
                child: Container(
                  height: screenHeight * 0.3,
                  width: screenWidth * 0.5,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [Color.fromRGBO(26, 26, 26, 1.0), Colors.transparent],
                    ),
                  ),
                ),
              ),
              Positioned(
                left: MediaQuery.of(context).size.width * 0.02,
                top: MediaQuery.of(context).size.height * 0.44,
                child: Text(
                  "Beverly Hills Cop", //fake.lorem.words(3).join(' '),
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.9),
                    fontSize: MediaQuery.of(context).size.width * 0.06,
                    fontWeight: FontWeight.w500,
                    decoration: TextDecoration.none,
                    fontFamily: 'AmaticSC',
                  ),
                ),
              ),
              Positioned(
                left: MediaQuery.of(context).size.width * 0.023,
                top: MediaQuery.of(context).size.height * 0.605,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    TextButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Color.fromRGBO(243, 243, 243, 1.0)),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width * 0.006),
                          ),
                        ),
                      ),
                      onPressed: () {
                        print("Play button pressed");
                      },
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width * 0.01,
                          vertical: MediaQuery.of(context).size.height * 0.004,
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(
                            right: MediaQuery.of(context).size.width * 0.006,
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.play_arrow_rounded,
                                color: Colors.black,
                                size: MediaQuery.of(context).size.width * 0.025,
                              ),
                              Text(
                                "Play",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: MediaQuery.of(context).size.width * 0.015,
                                  fontWeight: FontWeight.w100,
                                  decoration: TextDecoration.none,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: MediaQuery.of(context).size.width * 0.002),
                    IconButton(
                        color: _isInMyList ? Colors.red : Color.fromRGBO(243, 243, 243, 1.0),
                        iconSize: MediaQuery.of(context).size.width * 0.0235,
                        onPressed: () {
                          print("Add to my list button pressed");
                          setState(() {
                            _isInMyList = !_isInMyList;
                          });
                        },
                        splashRadius: 2,
                        icon: Icon(
                            Icons.add_circle_outline_rounded
                        )
                    ),
                  ],
                ),
              ),
              Positioned(
                right: MediaQuery.of(context).size.width * 0.001,
                top: MediaQuery.of(context).size.height * 0.001,
                child: IconButton(
                  onPressed: () {
                    widget.onClose();
                  },
                  icon: Icon(
                    Icons.close_rounded,
                    color: Color.fromRGBO(114, 114, 114, 1.0),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(
              left: MediaQuery.of(context).size.width * 0.023,
            ),
            child: Row(
              children: [
                Text(
                  "${88}% Match",
                  style: TextStyle(
                    color: Colors.green,
                    fontSize: MediaQuery.of(context).size.width * 0.01,
                    fontWeight: FontWeight.w600,
                    decoration: TextDecoration.none,
                  ),
                ),
                SizedBox(width: MediaQuery.of(context).size.width * 0.01),
                Text(
                  "2019",
                  style: TextStyle(
                    color: Color.fromRGBO(145, 145, 145, 1.0),
                    fontSize: MediaQuery.of(context).size.width * 0.01,
                    fontWeight: FontWeight.w400,
                    decoration: TextDecoration.none,
                  ),
                ),
                SizedBox(width: MediaQuery.of(context).size.width * 0.005),
                Text(
                  "1h 39m",
                  style: TextStyle(
                    color: Color.fromRGBO(145, 145, 145, 1.0),
                    fontSize: MediaQuery.of(context).size.width * 0.01,
                    fontWeight: FontWeight.w500,
                    decoration: TextDecoration.none,
                  ),
                ),
                SizedBox(width: MediaQuery.of(context).size.width * 0.005),
                Icon(
                  Icons.hd_outlined,
                  size: MediaQuery.of(context).size.width * 0.016,
                  color: Color.fromRGBO(145, 145, 145, 1.0),
                ),
                SizedBox(width: MediaQuery.of(context).size.width * 0.005),
                Icon(
                  Icons.transcribe_outlined,
                  size: MediaQuery.of(context).size.width * 0.016,
                  color: Color.fromRGBO(145, 145, 145, 1.0),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: MediaQuery.of(context).size.width * 0.0215,
            ),
            child: Row(
              children: [
                Icon(
                  Icons.eighteen_up_rating,
                  size: MediaQuery.of(context).size.width * 0.016,
                  color: Color.fromRGBO(145, 145, 145, 1.0),
                ),
                SizedBox(width: MediaQuery.of(context).size.width * 0.002),
                Text(
                  "violence, sex, language",
                  style: TextStyle(
                    color: Color.fromRGBO(145, 145, 145, 1.0),
                    fontSize: MediaQuery.of(context).size.width * 0.01,
                    fontWeight: FontWeight.w500,
                    decoration: TextDecoration.none,
                  ),
                ),
              ],
            ),
          ),

          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.015,
                left: MediaQuery.of(context).size.width * 0.0215,
              ),
              child: Text(
                "Description:",
                style: TextStyle(
                  color: Color.fromRGBO(84, 84, 84, 1.0),
                  fontSize: MediaQuery.of(context).size.width * 0.01,
                  fontWeight: FontWeight.w500,
                  decoration: TextDecoration.none,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).size.height * 0.015,
                left: MediaQuery.of(context).size.width * 0.0215,
                right: MediaQuery.of(context).size.width * 0.016,
              ),
              child: Text(
                "Forty years after his unforgettable first case in Beverly Hills, Detroit cop Axel Foley returns to do what he does best: solve crimes and cause chaos.",
                style: TextStyle(
                  color: Color.fromRGBO(145, 145, 145, 1.0),
                  fontSize: MediaQuery.of(context).size.width * 0.01,
                  fontWeight: FontWeight.w500,
                  decoration: TextDecoration.none,
                ),
              ),
            ),
          ),

          Padding(
            padding: EdgeInsets.only(
              right: MediaQuery.of(context).size.width * 0.016,
              bottom: MediaQuery.of(context).size.height * 0.02,
            ),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.only(
                      // top: MediaQuery.of(context).size.height * 0.015,
                      left: MediaQuery.of(context).size.width * 0.0215,
                    ),
                    alignment: Alignment.topLeft,
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "Cast: ",
                            style: TextStyle(
                              color: Color.fromRGBO(84, 84, 84, 1.0),
                              fontSize: MediaQuery.of(context).size.width * 0.01,
                              fontWeight: FontWeight.w500,
                              decoration: TextDecoration.none,
                            ),
                          ),
                          TextSpan(
                            text: "Eddie Murphy, Mark Molloy, Joseph Gordon-Levitt, Taylour Paige, Paul Reiser, John Amos, more",
                            style: TextStyle(
                              color: Color.fromRGBO(145, 145, 145, 1.0),
                              fontSize: MediaQuery.of(context).size.width * 0.01,
                              fontWeight: FontWeight.w500,
                              decoration: TextDecoration.none,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.015,
                      left: MediaQuery.of(context).size.width * 0.0215,
                    ),
                    alignment: Alignment.topLeft,
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "Genres: ",
                            style: TextStyle(
                              color: Color.fromRGBO(84, 84, 84, 1.0),
                              fontSize: MediaQuery.of(context).size.width * 0.01,
                              fontWeight: FontWeight.w500,
                              decoration: TextDecoration.none,
                            ),
                          ),
                          TextSpan(
                            text: "Action & Adventure, Comedy, Crime Movies",
                            style: TextStyle(
                              color: Color.fromRGBO(145, 145, 145, 1.0),
                              fontSize: MediaQuery.of(context).size.width * 0.01,
                              fontWeight: FontWeight.w500,
                              decoration: TextDecoration.none,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
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