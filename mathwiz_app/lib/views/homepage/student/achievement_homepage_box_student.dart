import 'package:flutter/material.dart';
import '../../../constants.dart';
import 'achievement_list.dart';

class AchievementHomepageBoxStudent extends StatefulWidget {
  @override
  _AchievementHomepageBoxStudentState createState() =>
      _AchievementHomepageBoxStudentState();
}

class _AchievementHomepageBoxStudentState
    extends State<AchievementHomepageBoxStudent> {
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
            Text('Achievements',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24.0,
                    color: Colors.white)),

            AchievementList(),
            SizedBox(height: 10),
          ],
        )
    );
  }
}
