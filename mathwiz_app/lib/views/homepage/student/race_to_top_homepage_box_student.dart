import 'package:flutter/material.dart';
import 'package:mathwiz_app/views/homepage/student/race_list.dart';
import '../../../constants.dart';

class RaceToTopHomepageBoxStudent extends StatefulWidget {
  @override
  _RaceToTopHomepageBoxStudentState createState() => _RaceToTopHomepageBoxStudentState();
}

class _RaceToTopHomepageBoxStudentState extends State<RaceToTopHomepageBoxStudent> {
  @override
  Widget build(BuildContext context) {
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

            RaceList(),
            SizedBox(height: 10),
          ],
        )
    );
  }
}
