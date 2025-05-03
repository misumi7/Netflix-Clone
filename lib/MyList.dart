import 'package:flutter/cupertino.dart';
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
    "assets/images/home_screen/posters/poster_16.jpg"
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
      width: screenWidth * 0.93,
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
                    bottom: screenHeight * 0.02,
                  ),
                  child: Text(
                    "M",
                    style: TextStyle(
                      color: Color.fromRGBO(218, 0, 0, 1.0),
                      decoration: TextDecoration.none,
                      fontSize: screenWidth * 0.051,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'BebasNeue',
                    ),
                  ),
                ),
                Container(
                  color: Colors.black,
                  padding: EdgeInsets.only(
                    top: screenHeight * 0.048,
                    bottom: screenHeight * 0.019,
                  ),
                  child: Text(
                    "y List",
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.85),
                      decoration: TextDecoration.none,
                      fontSize: screenWidth * 0.05,
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
                  shrinkWrap: true,// after notifyListeners
                  itemCount: myListModel.posterPaths.length,
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
                            // titleAlignment: ListTileTitleAlignment.center,
                            contentPadding: EdgeInsets.zero,
                            title: Row(
                              children: [
                                Container(
                                  width: screenWidth * 0.085,
                                  height: screenHeight * 0.1,
                                  child: Stack(
                                    children: [
                                      Align(
                                        alignment: Alignment.center,
                                        child: AspectRatio(
                                          aspectRatio: 5 / 3,
                                          child: Image.asset(
                                            item,
                                            fit: BoxFit.cover,
                                            alignment: Alignment(0.0, -0.6),
                                            width: screenWidth * 0.085,
                                            // height: screenHeight * 0.1,
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment.center,
                                        child: AspectRatio(
                                          aspectRatio: 5 / 3,
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
                                  width: screenWidth * 0.25,
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                      left: screenWidth * 0.015,
                                    ),
                                    child: Text(
                                      "Movie Title", // item.name.substring(0, min(75, item.name.length)) + (item.name.length > 75 ? ".." : "")
                                      maxLines: 1,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: screenWidth * 0.0125,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  width: screenWidth * 0.05,
                                  child: Text(
                                    textAlign: TextAlign.center,
                                    "Year", // item.name.substring(0, min(75, item.name.length)) + (item.name.length > 75 ? ".." : "")
                                    maxLines: 1,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: screenWidth * 0.0125,
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
                                  width: screenWidth * 0.05,
                                  child: Text(
                                    textAlign: TextAlign.center,
                                    "1h 34m", // item.name.substring(0, min(75, item.name.length)) + (item.name.length > 75 ? ".." : "")
                                    maxLines: 1,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: screenWidth * 0.0125,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ],
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