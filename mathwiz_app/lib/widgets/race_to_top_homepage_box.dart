import 'package:flutter/material.dart';
import 'package:mathwiz_app/views/trivia/quiz.dart';

import '../constants.dart';

class RaceToTopHomepageBox extends StatelessWidget {
  final List<Widget> activtyList =
      ["Race to the Top - Multiplication"].map((i) {
    return Builder(
      builder: (BuildContext context) {
        return Container(
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.symmetric(vertical: 3, horizontal: 10),
          decoration: BoxDecoration(color: kSecondaryColor),
          child: ElevatedButton(
            child: Text('$i'),
            style: ElevatedButton.styleFrom(
              primary: Colors.white,
              onPrimary: Colors.black,
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
            ),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return QuizScreen();
                    },
                  ),
                );
            },
          ),
        );
      },
    );
  }).toList();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.symmetric(horizontal: 5.0),
        decoration: BoxDecoration(
            border: Border.all(
              color: kPrimaryColor,
            ),
            color: kPrimaryColor,
            borderRadius: BorderRadius.all(Radius.circular(20))),
        child: Column(
          children: <Widget>[
            SizedBox(height: 10),
            Text('Race to the Top',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24.0,
                    color: Colors.white)),
            SizedBox(height: 10),
            for (var item in activtyList) Container(child: item),
          ],
        ));
  }
}
