import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:netflix_clone/MyList.dart';
import 'package:provider/provider.dart';

class MovieCard extends StatefulWidget {
  const MovieCard({super.key, required this.posterPath, required this.description, required this.onClose});

  final String posterPath;
  final String description;
  final Function() onClose;

  @override
  State<MovieCard> createState() => _MovieCardState();
}

class _MovieCardState extends State<MovieCard>{
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Container(
      padding: EdgeInsets.only(
        top: kIsWeb ? screenHeight * 0.018 : screenHeight * 0.0345,
        bottom: screenHeight * 0.017,
      ),
      color: Color.fromRGBO(0, 0, 0, 0.5),
      width: kIsWeb ? screenWidth * 0.93 : screenWidth,
      height: kIsWeb ? screenHeight : screenHeight * 0.93,
      child: Center(
        child: Container(
          width: kIsWeb ? screenWidth * 0.45 : screenWidth * 0.9,
          decoration: BoxDecoration(
            color: Color.fromRGBO(26, 26, 26, 1.0),
            borderRadius: BorderRadius.circular(kIsWeb ? screenWidth * 0.01 : screenHeight * 0.015),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(kIsWeb ? screenWidth * 0.01 : screenHeight * 0.015),
                      child: Image.asset(
                        widget.posterPath,
                        alignment: Alignment(0.0, -0.4),
                        height: kIsWeb ? screenHeight * 0.7 : screenHeight * 0.335,
                        width: kIsWeb ? screenWidth * 0.45 : screenWidth * 0.9,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      top: kIsWeb ? screenHeight * 0.4 + 1 : 0,
                      left: 0,
                      right: 0,
                      child: Container(
                        height: kIsWeb ? screenHeight * 0.3 : screenHeight * 0.335,
                        width: kIsWeb ? screenWidth * 0.45 : screenWidth * 0.9,
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
                          fontSize: kIsWeb ? screenWidth * 0.06 : screenHeight * 0.08,
                          fontWeight: FontWeight.w500,
                          decoration: TextDecoration.none,
                          fontFamily: 'AmaticSC',
                        ),
                      ),
                    ),
                    Positioned(
                      left: MediaQuery.of(context).size.width * 0.023,
                      top: kIsWeb ? screenHeight * 0.605 : screenHeight * 0.23,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          TextButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(Color.fromRGBO(243, 243, 243, 1.0)),
                              shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(kIsWeb ? screenWidth * 0.006 : screenHeight * 0.01),
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
                                      size: kIsWeb ? screenWidth * 0.025 : screenHeight * 0.03,
                                    ),
                                    Text(
                                      "Play",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: kIsWeb ? screenWidth * 0.015 : screenHeight * 0.025,
                                        fontWeight: kIsWeb ? FontWeight.w100 : FontWeight.w400,
                                        decoration: TextDecoration.none,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: MediaQuery.of(context).size.width * 0.002),
                          Consumer<MyListModel>(
                            builder: (context, value, child) {
                              bool isFavorite = value.isFavorite(widget.posterPath);
                              return IconButton(
                                  color: isFavorite ? Colors.red : Color.fromRGBO(243, 243, 243, 1.0),
                                  iconSize: kIsWeb ? screenWidth * 0.0235 : screenHeight * 0.04,
                                  onPressed: () {
                                    if(isFavorite) {
                                      value.remove(widget.posterPath);
                                    }
                                    else {
                                      value.add(widget.posterPath);
                                    }
                                  },
                                  splashRadius: 2,
                                  icon: Icon(
                                      Icons.add_circle_outline_rounded,
                                  )
                              );
                            }
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
                    top: kIsWeb ? 0 : screenHeight * 0.007,
                    left: MediaQuery.of(context).size.width * 0.023,
                  ),
                  child: Row(
                    children: [
                      Text(
                        "${88}% Match",
                        style: TextStyle(
                          fontFamily: 'Calibri',
                          color: Colors.green,
                          fontSize: kIsWeb ? screenWidth * 0.01 : screenHeight * 0.02,
                          fontWeight: FontWeight.w600,
                          decoration: TextDecoration.none,
                        ),
                      ),
                      SizedBox(
                        width: kIsWeb ? screenWidth * 0.005 : screenHeight * 0.005,
                      ),
                      Text(
                        "2019",
                        style: TextStyle(
                          fontFamily: 'Calibri',
                          color: Color.fromRGBO(145, 145, 145, 1.0),
                          fontSize: kIsWeb ? screenWidth * 0.01 : screenHeight * 0.02,
                          fontWeight: FontWeight.w400,
                          decoration: TextDecoration.none,
                        ),
                      ),
                      SizedBox(
                        width: kIsWeb ? screenWidth * 0.005 : screenHeight * 0.005,
                      ),
                      Text(
                        "1h 39m",
                        style: TextStyle(
                          fontFamily: 'Calibri',
                          color: Color.fromRGBO(145, 145, 145, 1.0),
                          fontSize: kIsWeb ? screenWidth * 0.01 : screenHeight * 0.02,
                          fontWeight: FontWeight.w500,
                          decoration: TextDecoration.none,
                        ),
                      ),
                      SizedBox(
                          width: kIsWeb ? screenWidth * 0.005 : screenHeight * 0.01,
                      ),
                      Icon(
                        Icons.hd_outlined,
                        size: kIsWeb ? screenWidth * 0.016 : screenHeight * 0.025,
                        color: Color.fromRGBO(145, 145, 145, 1.0),
                      ),
                      SizedBox(
                        width: kIsWeb ? screenWidth * 0.005 : screenHeight * 0.005,
                      ),
                      Icon(
                        Icons.transcribe_outlined,
                        size: kIsWeb ? screenWidth * 0.016 : screenHeight * 0.025,
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
                        size: kIsWeb ? screenWidth * 0.016 : screenHeight * 0.026,
                        color: Color.fromRGBO(145, 145, 145, 1.0),
                      ),
                      SizedBox(
                        width: kIsWeb ? screenWidth * 0.002 : screenHeight * 0.002,
                      ),
                      Text(
                        "violence, sex, language",
                        style: TextStyle(
                          fontFamily: 'Calibri',
                          color: Color.fromRGBO(145, 145, 145, 1.0),
                          fontSize: kIsWeb ? screenWidth * 0.01 : screenHeight * 0.02,
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
                        fontSize: kIsWeb ? screenWidth * 0.01 : screenHeight * 0.02,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Calibri',
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
                      widget.description,
                      style: TextStyle(
                        fontFamily: 'Calibri',
                        color: Color.fromRGBO(145, 145, 145, 1.0),
                        fontSize: kIsWeb ? screenWidth * 0.01 : screenHeight * 0.02,
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
                                    fontFamily: 'Calibri',
                                    color: Color.fromRGBO(84, 84, 84, 1.0),
                                    fontSize: kIsWeb ? screenWidth * 0.01 : screenHeight * 0.02,
                                    fontWeight: FontWeight.w500,
                                    decoration: TextDecoration.none,
                                  ),
                                ),
                                TextSpan(
                                  text: "Eddie Murphy, Mark Molloy, Joseph Gordon-Levitt, Taylour Paige, Paul Reiser, John Amos, more",
                                  style: TextStyle(
                                    color: Color.fromRGBO(145, 145, 145, 1.0),
                                    fontSize: kIsWeb ? screenWidth * 0.01 : screenHeight * 0.02,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'Calibri',
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
                                    fontFamily: 'Calibri',
                                    color: Color.fromRGBO(84, 84, 84, 1.0),
                                    fontSize: kIsWeb ? screenWidth * 0.01 : screenHeight * 0.02,
                                    fontWeight: FontWeight.w500,
                                    decoration: TextDecoration.none,
                                  ),
                                ),
                                TextSpan(
                                  text: "Action & Adventure, Comedy, Crime Movies",
                                  style: TextStyle(
                                    fontFamily: 'Calibri',
                                    color: Color.fromRGBO(145, 145, 145, 1.0),
                                    fontSize: kIsWeb ? screenWidth * 0.01 : screenHeight * 0.02,
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
          ),
        ),
      ),
    );
  }
}