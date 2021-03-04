import 'package:flutter/material.dart';

import '../constants.dart';

class RaceToTopHomepageBox extends StatelessWidget {
  final List<Widget> activtyList =
      ["Race to the Top - Multiplication"].map((i) {
    return Builder(
      builder: (BuildContext context) {
        return Container(
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.symmetric(vertical: 3, horizontal: 10),
          decoration: BoxDecoration(color: kPrimaryLightColor),
          child: ElevatedButton(
            child: Text('$i'),
            style: ElevatedButton.styleFrom(
                primary: kPrimaryColor,
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                textStyle: TextStyle(color: Colors.white)),
            onPressed: () {},
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
        decoration: BoxDecoration(color: kPrimaryLightColor),
        child: Column(
          children: <Widget>[
            SizedBox(height: 10),
            Text('Race to the Top',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24.0,
                  decoration: TextDecoration.underline,
                )),
            SizedBox(height: 10),
            for (var item in activtyList) Container(child: item),
          ],
        ));
  }
}
