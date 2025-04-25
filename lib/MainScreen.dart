import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget{
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Banner(),

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
            MovieSlider(itemSize: MediaQuery.of(context).size.width * 0.09, movieList: ["assets/images/home_screen/1.jpg","assets/images/home_screen/1.jpg","assets/images/home_screen/1.jpg","assets/images/home_screen/1.jpg","assets/images/home_screen/1.jpg","assets/images/home_screen/1.jpg","assets/images/home_screen/1.jpg","assets/images/home_screen/1.jpg","assets/images/home_screen/1.jpg","assets/images/home_screen/1.jpg","assets/images/home_screen/1.jpg","assets/images/home_screen/1.jpg","assets/images/home_screen/1.jpg","assets/images/home_screen/1.jpg","assets/images/home_screen/1.jpg","assets/images/home_screen/1.jpg","assets/images/home_screen/1.jpg","assets/images/home_screen/1.jpg","assets/images/home_screen/1.jpg","assets/images/home_screen/1.jpg","assets/images/home_screen/1.jpg","assets/images/home_screen/1.jpg","assets/images/home_screen/1.jpg","assets/images/home_screen/1.jpg","assets/images/home_screen/1.jpg","assets/images/home_screen/1.jpg","assets/images/home_screen/1.jpg","assets/images/home_screen/1.jpg"]),

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
            MovieSlider(itemSize: MediaQuery.of(context).size.width * 0.09, movieList: ["assets/images/home_screen/1.jpg","assets/images/home_screen/1.jpg","assets/images/home_screen/1.jpg","assets/images/home_screen/1.jpg","assets/images/home_screen/1.jpg","assets/images/home_screen/1.jpg","assets/images/home_screen/1.jpg","assets/images/home_screen/1.jpg","assets/images/home_screen/1.jpg","assets/images/home_screen/1.jpg","assets/images/home_screen/1.jpg","assets/images/home_screen/1.jpg","assets/images/home_screen/1.jpg","assets/images/home_screen/1.jpg","assets/images/home_screen/1.jpg","assets/images/home_screen/1.jpg","assets/images/home_screen/1.jpg","assets/images/home_screen/1.jpg","assets/images/home_screen/1.jpg","assets/images/home_screen/1.jpg","assets/images/home_screen/1.jpg","assets/images/home_screen/1.jpg","assets/images/home_screen/1.jpg","assets/images/home_screen/1.jpg","assets/images/home_screen/1.jpg","assets/images/home_screen/1.jpg","assets/images/home_screen/1.jpg","assets/images/home_screen/1.jpg"]),

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
            MovieSlider(itemSize: MediaQuery.of(context).size.width * 0.09, movieList: ["assets/images/home_screen/1.jpg","assets/images/home_screen/1.jpg","assets/images/home_screen/1.jpg","assets/images/home_screen/1.jpg","assets/images/home_screen/1.jpg","assets/images/home_screen/1.jpg","assets/images/home_screen/1.jpg","assets/images/home_screen/1.jpg","assets/images/home_screen/1.jpg","assets/images/home_screen/1.jpg","assets/images/home_screen/1.jpg","assets/images/home_screen/1.jpg","assets/images/home_screen/1.jpg","assets/images/home_screen/1.jpg","assets/images/home_screen/1.jpg","assets/images/home_screen/1.jpg","assets/images/home_screen/1.jpg","assets/images/home_screen/1.jpg","assets/images/home_screen/1.jpg","assets/images/home_screen/1.jpg","assets/images/home_screen/1.jpg","assets/images/home_screen/1.jpg","assets/images/home_screen/1.jpg","assets/images/home_screen/1.jpg","assets/images/home_screen/1.jpg","assets/images/home_screen/1.jpg","assets/images/home_screen/1.jpg","assets/images/home_screen/1.jpg"]),

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
            MovieSlider(itemSize: MediaQuery.of(context).size.width * 0.09, movieList: ["assets/images/home_screen/1.jpg","assets/images/home_screen/1.jpg","assets/images/home_screen/1.jpg","assets/images/home_screen/1.jpg","assets/images/home_screen/1.jpg","assets/images/home_screen/1.jpg","assets/images/home_screen/1.jpg","assets/images/home_screen/1.jpg","assets/images/home_screen/1.jpg","assets/images/home_screen/1.jpg","assets/images/home_screen/1.jpg","assets/images/home_screen/1.jpg","assets/images/home_screen/1.jpg","assets/images/home_screen/1.jpg","assets/images/home_screen/1.jpg","assets/images/home_screen/1.jpg","assets/images/home_screen/1.jpg","assets/images/home_screen/1.jpg","assets/images/home_screen/1.jpg","assets/images/home_screen/1.jpg","assets/images/home_screen/1.jpg","assets/images/home_screen/1.jpg","assets/images/home_screen/1.jpg","assets/images/home_screen/1.jpg","assets/images/home_screen/1.jpg","assets/images/home_screen/1.jpg","assets/images/home_screen/1.jpg","assets/images/home_screen/1.jpg"]),

            // Final padding
            SizedBox(
              width: screenWidth,
              height: screenHeight * 0.03,
            ),
          ],
        ),
      ),
    );
  }
}

class MovieSlider extends StatefulWidget {
  const MovieSlider({super.key, required this.movieList, required this.itemSize});

  final List<String> movieList;
  final double itemSize;

  @override
  State<MovieSlider> createState() => _MovieSliderState();
}

class _MovieSliderState extends State<MovieSlider> {
  final ScrollController _scrollController = ScrollController();
  bool _isAnimating = false;

  void _scrollRight() async{
    if (!_isAnimating && _scrollController.offset + _scrollController.offset + widget.itemSize + MediaQuery.of(context).size.width * 0.002 < _scrollController.position.maxScrollExtent) {
      setState(() {
        _isAnimating = true;
      });
      await _scrollController.animateTo(_scrollController.offset + widget.itemSize + MediaQuery.of(context).size.width * 0.002,
          duration: Duration(milliseconds: 200), curve: Curves.ease);
      setState(() {
        _isAnimating = false;
      });
    }
  }

  void _scrollLeft() async{
    if (!_isAnimating && _scrollController.offset - widget.itemSize - MediaQuery.of(context).size.width * 0.002 > _scrollController.position.minScrollExtent) {
      setState(() {
        _isAnimating = true;
      });
      await _scrollController.animateTo(_scrollController.offset - widget.itemSize - MediaQuery.of(context).size.width * 0.002,
          duration: Duration(milliseconds: 200), curve: Curves.ease);
      setState(() {
        _isAnimating = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        // left: MediaQuery.of(context).size.width * 0.02,
      ),
      height: MediaQuery.of(context).size.height * 0.3,
      child: Stack(
        children: [
          ScrollConfiguration(
            behavior: NoScrollBehaviour(),
            child: ListView.builder(
              controller: _scrollController,
              scrollDirection: Axis.horizontal,
              itemCount: widget.movieList.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.005,
                    bottom: MediaQuery.of(context).size.height * 0.005,
                    left: MediaQuery.of(context).size.width * 0.001,
                    right: MediaQuery.of(context).size.width * 0.001,
                  ),
                  child: Image.asset(
                    width: widget.itemSize,
                    widget.movieList[index],
                    fit: BoxFit.contain,
                    alignment: Alignment.center,
                  ),
                );
              }
            ),
          ),
          Positioned(
              left: MediaQuery.of(context).size.width * 0.01,
              top: 0,
              bottom: 0,
              child: IconButton(
                  onPressed: _scrollLeft,
                  icon: Icon(
                    Icons.chevron_left_rounded,
                    color: Colors.white70,
                  ),
              ),
          ),
          Positioned(
              right: MediaQuery.of(context).size.width * 0.01,
              top: 0,
              bottom: 0,
              child: IconButton(
                  onPressed: _scrollRight,
                  icon: Icon(
                    Icons.chevron_right_rounded,
                    color: Colors.white70,
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
  ScrollPhysics getScrollPhysics(BuildContext context) {
    return const NeverScrollableScrollPhysics(); // turn off the scrolling
  }
}

class Banner extends StatelessWidget{
  const Banner({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Stack(
            children: [
              Image.asset(
                'assets/images/home_screen/witcher_banner.jpg',
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
                bottom: 0,
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
                left: 0,
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
                            " 8.8 / 10",
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
                              opacity: 0.7,
                              child: Image.asset(
                                  'assets/images/home_screen/witcher_logo.png',
                                  width: screenWidth * 0.17,
                                  height: screenWidth * 0.17,
                                  fit: BoxFit.fitWidth,
                                  alignment: Alignment.center,
                                ),
                              ),
                              Text.rich(
                                softWrap: true,
                                TextSpan(
                                  children: [
                                    TextSpan(
                                      text: "T".toUpperCase(),
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
                                      text: "he Witcher".toUpperCase(),
                                      style: TextStyle(
                                        fontFamily: "BebasNeue",
                                        color: Color.fromRGBO(227, 227, 227, 1.0),
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
                left: screenWidth * 0.29 - 1,
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