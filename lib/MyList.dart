import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyListModel extends ChangeNotifier {
  final List<String> posterPaths = [
    "assets/images/home_screen/posters/poster_1.jpg",
    "assets/images/home_screen/posters/poster_2.jpg",
    "assets/images/home_screen/posters/poster_3.jpg",
    "assets/images/home_screen/posters/poster_4.jpg",
    "assets/images/home_screen/posters/poster_5.jpg",
    "assets/images/home_screen/posters/poster_6.jpg",
    "assets/images/home_screen/posters/poster_7.jpg",
    "assets/images/home_screen/posters/poster_8.jpg",
    "assets/images/home_screen/posters/poster_9.jpg",
    "assets/images/home_screen/posters/poster_10.jpg",
    "assets/images/home_screen/posters/poster_11.jpg",
    "assets/images/home_screen/posters/poster_12.jpg",
    "assets/images/home_screen/posters/poster_13.jpg",
    "assets/images/home_screen/posters/poster_14.jpg",
    "assets/images/home_screen/posters/poster_15.jpg",
    "assets/images/home_screen/posters/poster_16.jpg",
    "assets/images/home_screen/posters/poster_17.jpg",
    "assets/images/home_screen/posters/poster_18.jpg",
    "assets/images/home_screen/posters/poster_19.jpg",
    "assets/images/home_screen/posters/poster_20.jpg",
    "assets/images/home_screen/posters/poster_21.jpg",
    "assets/images/home_screen/posters/poster_22.jpg",
    "assets/images/home_screen/posters/poster_23.jpg",
  ];

  void add(String item) {
    if (!posterPaths.contains(item)) {
      posterPaths.add(item);
      notifyListeners();
    }
  }

  void remove(String item) {
    posterPaths.remove(item);
    notifyListeners();
  }

  bool isFavorite(String item) {
    return posterPaths.contains(item);
  }
}

class MyList extends StatefulWidget {
  const MyList({super.key});

  @override
  State<MyList> createState() => _MyListState();
}

class _MyListState extends State<MyList> {
  int currentMovieIndex = -1;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Container(
      width: kIsWeb ? screenWidth * 0.93 : screenWidth,
      height: kIsWeb ? screenHeight : screenHeight * 0.93,
      alignment: Alignment.topLeft,
      color: Colors.black,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  color: Colors.black,
                  padding: EdgeInsets.only(
                    top: screenHeight * 0.048,
                    bottom: kIsWeb ? screenHeight * 0.0151 : screenHeight * 0.002,
                    left: kIsWeb ? 0 : screenWidth * 0.02,
                  ),
                  child: Text(
                    "M",
                    style: TextStyle(
                      color: Color.fromRGBO(218, 0, 0, 1.0),
                      decoration: TextDecoration.none,
                      fontSize: kIsWeb ? screenWidth * 0.051 : screenHeight * 0.051,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'BebasNeue',
                    ),
                  ),
                ),
                Container(
                  color: Colors.black,
                  padding: EdgeInsets.only(
                    top: screenHeight * 0.048,
                    bottom: kIsWeb ? screenHeight * 0.014 : screenHeight * 0.002,
                  ),
                  child: Text(
                    "y List",
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.85),
                      decoration: TextDecoration.none,
                      fontSize: kIsWeb ? screenWidth * 0.05 : screenHeight * 0.05,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'BebasNeue',
                    ),
                  ),
                ),
              ],
            ),
            Consumer<MyListModel>(
              builder: (context, myListModel, child) {
                return ListView.builder(
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  itemCount: myListModel.posterPaths.length,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    final item = myListModel.posterPaths[index];
                    return MouseRegion(
                      onEnter: (_) => setState(() => currentMovieIndex = index),
                      onExit: (_) => setState(() => currentMovieIndex = -1),
                      child: Material(
                        color: Colors.transparent,
                        child: AnimatedContainer(
                          duration: Duration(milliseconds: 200),
                          curve: Curves.easeInOut,
                          color: currentMovieIndex == index ? Color.fromRGBO(26, 26, 26, 1.0) : Colors.black,
                          child: ListTile(
                            contentPadding: EdgeInsets.zero,
                            title: kIsWeb ? Row(
                                children: [
                                  Container(
                                    width: kIsWeb ? screenWidth * 0.085 : screenHeight * 0.13,
                                    height: kIsWeb ? screenHeight * 0.15 : screenWidth * 0.33,
                                    padding: EdgeInsets.only(
                                      left: kIsWeb ? 0 : screenWidth * 0.022,
                                    ),
                                    child: Stack(
                                      children: [
                                        Align(
                                          alignment: Alignment.center,
                                          child: AspectRatio(
                                            aspectRatio: kIsWeb ? 100 / 65 : 5 / 6,
                                            child: Image.asset(
                                              item,
                                              fit: BoxFit.cover,
                                              alignment: Alignment(0.0, -0.65),
                                              // height: screenHeight * 0.1,
                                            ),
                                          ),
                                        ),
                                        Align(
                                          alignment: Alignment.center,
                                          child: AspectRatio(
                                            aspectRatio: kIsWeb ? 100 / 65 : 5 / 6,
                                            child: AnimatedContainer(
                                              duration: Duration(milliseconds: 200),
                                              curve: Curves.easeInOut,
                                              width: screenWidth * 0.085,
                                              decoration: BoxDecoration(
                                                color: currentMovieIndex == index ? Color.fromRGBO(0, 0, 0, 0.5) : Colors.transparent,
                                              ),
                                              child: AnimatedOpacity(
                                                duration: Duration(milliseconds: 200),
                                                curve: Curves.easeInOut,
                                                opacity: currentMovieIndex == index ? 1.0 : 0.0,
                                                child: Center(
                                                  child: Icon(
                                                    Icons.play_circle_outline_rounded,
                                                    color: Color.fromRGBO(227, 227, 227, 1.0),
                                                    size: screenWidth * 0.02,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    width: kIsWeb ? screenWidth * 0.25 : screenHeight * 0.109,
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                        left: kIsWeb ? screenWidth * 0.015 : screenHeight * 0.013,
                                      ),
                                      child: Text(
                                        "Movie Title", // item.name.substring(0, min(75, item.name.length)) + (item.name.length > 75 ? ".." : "")
                                        maxLines: 1,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: kIsWeb ? screenWidth * 0.0125 : screenHeight * 0.0125,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: kIsWeb ? screenWidth * 0.05 : screenHeight * 0.05,
                                    child: Text(
                                      textAlign: TextAlign.center,
                                      "Year", // item.name.substring(0, min(75, item.name.length)) + (item.name.length > 75 ? ".." : "")
                                      maxLines: 1,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: kIsWeb ? screenWidth * 0.0125 : screenHeight * 0.0125,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                  Icon(
                                    Icons.thirteen_mp_rounded,
                                    color: Color.fromRGBO(227, 227, 227, 1.0),
                                  ),
                                  SizedBox(
                                    width: screenWidth * 0.05,
                                  ),
                                  Container(
                                    width: kIsWeb ? screenWidth * 0.05 : screenHeight * 0.05,
                                    child: Text(
                                      textAlign: TextAlign.center,
                                      "1h 34m", // item.name.substring(0, min(75, item.name.length)) + (item.name.length > 75 ? ".." : "")
                                      maxLines: 1,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: kIsWeb ? screenWidth * 0.0125 : screenHeight * 0.0125,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            :
                              Row(
                                children: [
                                  Container(
                                    width: kIsWeb ? screenWidth * 0.085 : screenHeight * 0.13,
                                    height: kIsWeb ? screenHeight * 0.15 : screenWidth * 0.33,
                                    padding: EdgeInsets.only(
                                      left: kIsWeb ? 0 : screenWidth * 0.022,
                                      top: 0,
                                      bottom: 0,
                                    ),
                                    child: Align(
                                      alignment: Alignment.center,
                                      child: AspectRatio(
                                        aspectRatio: kIsWeb ? 100 / 65 : 5 / 6,
                                        child: Image.asset(
                                          item,
                                          fit: BoxFit.cover,
                                          alignment: Alignment(0.0, -0.65),
                                          // height: screenHeight * 0.1,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Column(
                                    children: [
                                      Row(
                                        children: [
                                          Container(
                                            padding: EdgeInsets.only(
                                              left: screenHeight * 0.0195,
                                            ),
                                            child: Text(
                                              "Movie Title",
                                              maxLines: 1,
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: screenHeight * 0.021,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ),
                                          Container(
                                            padding: EdgeInsets.only(
                                              left: screenHeight * 0.005,
                                            ),
                                            child: Text(
                                              textAlign: TextAlign.center,
                                              "(2019)",
                                              maxLines: 1,
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: screenHeight * 0.021,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ),
                                        ]
                                      ),
                                      Container(
                                        padding: EdgeInsets.only(
                                          left: screenHeight * 0.016,
                                        ),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            for(int i = 0; i < 5; ++i)
                                              Icon(
                                                Icons.star,
                                                color: Color.fromRGBO(227, 227, 227, 1.0),
                                                size: screenWidth * 0.035,
                                              ),
                                            SizedBox(
                                              width: screenWidth * 0.01,
                                            ),
                                            Icon(
                                              Icons.thirteen_mp_rounded,
                                              color: Color.fromRGBO(227, 227, 227, 1.0),
                                              size: screenWidth * 0.042,
                                            ),
                                            SizedBox(
                                              width: screenWidth * 0.01,
                                            ),
                                            Text(
                                              textAlign: TextAlign.center,
                                              "1h 34m",
                                              maxLines: 1,
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: screenHeight * 0.019,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ]
                              ),
                            trailing: Padding(
                              padding: EdgeInsets.only(
                                right: screenWidth * 0.02,
                              ),
                              child: IconButton(
                                onPressed: () {
                                  setState(() {
                                    myListModel.posterPaths.removeAt(index);
                                  });
                                },
                                icon: Icon(
                                  Icons.highlight_remove_rounded,
                                  color: Color.fromRGBO(227, 227, 227, 1.0),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  }
                );
              }
            ),
          ],
        ),
      ),
    );
  }
}