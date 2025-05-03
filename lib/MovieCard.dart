import 'package:flutter/cupertino.dart';
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
  bool _isInMyList = false;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Container(
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
          child: SingleChildScrollView(
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
                          Consumer<MyListModel>(
                            builder: (context, value, child) {
                              bool isFavorite = value.isFavorite(widget.posterPath);
                              return IconButton(
                                  color: isFavorite ? Colors.red : Color.fromRGBO(243, 243, 243, 1.0),
                                  iconSize: MediaQuery.of(context).size.width * 0.0235,
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
                      widget.description,
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
          ),
        ),
      ),
    );
  }
}