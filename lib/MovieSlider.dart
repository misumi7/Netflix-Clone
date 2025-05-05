import 'dart:async';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CustomDiamondClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.moveTo(size.width * 0.25, 0);
    path.lineTo(size.width, 0);
    path.lineTo(size.width * 0.75, size.height);
    path.lineTo(0, size.height);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class MovieSlider extends StatefulWidget {
  MovieSlider({super.key,
    this.scrollSpeed = 0.0,
    this.format = 0,
    double? itemHeight,
    required this.isScrolling,
    required this.movieList,
    required this.itemSize,
    required this.onMovieTap}) :
        this.itemHeight = itemHeight ?? itemSize * 1.5;

  final List<String> movieList;
  double itemSize;
  double itemHeight;
  final Function(int) onMovieTap;
  final bool isScrolling;
  final double scrollSpeed;
  final int format;

  @override
  State<MovieSlider> createState() => _MovieSliderState();
}

class _MovieSliderState extends State<MovieSlider> {
  final ScrollController _scrollController = ScrollController();
  bool _isAnimating = false;

  late Timer _timer;
  bool _scrollForward = true;

  @override
  void initState(){
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients && widget.format != 0) {
        _scrollController.jumpTo(_scrollController.offset + widget.itemSize * 0.225);
      }
    });

    _timer = Timer.periodic(Duration(milliseconds: 16), (timer) {
      if(!_scrollController.hasClients) return; // waits until the controller is ready
      double currentOffset = _scrollController.offset;
      if(widget.isScrolling) {
        if (_scrollForward) {
          if (currentOffset >= _scrollController.position.maxScrollExtent) {
            _scrollForward = false;
          }
          else {
            _scrollController.jumpTo(currentOffset + widget.scrollSpeed);
          }
        }
        else {
          if (currentOffset <= _scrollController.position.minScrollExtent) {
            _scrollForward = true;
          }
          else {
            _scrollController.jumpTo(currentOffset - widget.scrollSpeed);
          }
        }
      }
    });
  }

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
    // if(_scrollController.hasClients && widget.format != 0){
    //   _scrollController.jumpTo(_scrollController.offset + widget.itemSize * 0.1);
    // }
    return SizedBox(
      height: widget.itemHeight, //(MediaQuery.of(context).size.height * 0.32).roundToDouble(),
      child: Stack(
        children: [
          ScrollConfiguration(
            behavior: kIsWeb ? NoScrollBehaviour() : ScrollBehavior(),
            child: ListView.builder(
                controller: _scrollController,
                scrollDirection: Axis.horizontal,
                itemCount: widget.movieList.length,
                itemBuilder: (context, index) {
                  return AspectRatio(
                    aspectRatio: widget.format == 0 ? 13 / 17 : 9 / 15,
                    child: ClipPath(
                      clipper: widget.format == 0 ? null : CustomDiamondClipper(),
                      child: Container(
                        width: widget.itemSize,
                        decoration: widget.format == 0 ? null : BoxDecoration(
                            color: Colors.black,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.white,
                                blurRadius: 100,
                                offset: Offset(0, 0),
                              ),
                            ]
                        ),
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
                      ),
                    ),
                  );
                }
            ),
          ),
          if (!widget.isScrolling && kIsWeb)
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
          if (!widget.isScrolling && kIsWeb)
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