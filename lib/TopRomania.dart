import 'dart:io';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class TopRomania extends StatelessWidget{
  TopRomania({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> posters = [];
    for (int i = 25; i < 35; ++i){
      posters.add("assets/images/home_screen/posters/poster_${i}.jpg");
    }

    return SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  color: Colors.black,
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.048,
                  ),
                  child: Text(
                    "T",
                    style: TextStyle(
                      color: Colors.red.withOpacity(0.85),
                      decoration: TextDecoration.none,
                      fontSize: MediaQuery.of(context).size.width * 0.051,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'BebasNeue',
                    ),
                  ),
                ),
                Container(
                  color: Colors.black,
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.048,
                  ),
                  child: Text(
                    "OP ROMANIA",
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.85),
                      decoration: TextDecoration.none,
                      fontSize: MediaQuery.of(context).size.width * 0.05,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'BebasNeue',
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.93,
              child: GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(), // for mobile scrolling
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: kIsWeb ? 4 : 1,
                  crossAxisSpacing: MediaQuery.of(context).size.width * 0.01,
                  mainAxisSpacing: MediaQuery.of(context).size.width * 0.04,
                  childAspectRatio: 1,
                ),
                itemCount: 10,
                padding: EdgeInsets.fromLTRB(16, 32, 16, 64),
                itemBuilder: (context, index) {
                  return Container(
                    // color: Colors.purple,
                     child: Stack(
                       alignment: Alignment.center,
                       children: [
                         Opacity(
                             opacity: 0.8,
                             child: Align(
                               alignment: kIsWeb ? (index == 9 ? Alignment(-1.55, 0.0) : Alignment(-1.05, 0.0)) :  (index == 9 ? Alignment(-1.13, 0.0) : Alignment(-0.9, 0.0)),
                               child: Text(
                                 (index + 1).toString(),
                                 style: TextStyle(
                                   color: Colors.white,
                                   decoration: TextDecoration.none,
                                   fontSize: kIsWeb ? MediaQuery.of(context).size.width * 0.11 : MediaQuery.of(context).size.width * 0.3,
                                   fontWeight: FontWeight.bold,
                                   fontFamily: 'BebasNeue',
                                   shadows: [
                                     Shadow(
                                       blurRadius: 1.0,
                                       color: Colors.red,
                                       offset: Offset(5.0, 2.0),
                                     ),
                                   ],
                                 ),
                               ),
                             ),
                         ),
                         Image.asset(
                           posters[index],
                           fit: BoxFit.cover,
                         ),
                       ],
                     ),
                  );
                },
              ),
            ),
          ],
        ),
    );
  }
}