import 'package:flutter/material.dart';
import 'package:mathwiz_app/views/homepage/teacher/achievement_list.dart';
import '../../../constants.dart';

class AchievementHomepageBoxTeacher extends StatefulWidget {
  @override
  _AchievementHomepageBoxTeacherState createState() =>
      _AchievementHomepageBoxTeacherState();
}

class _AchievementHomepageBoxTeacherState
    extends State<AchievementHomepageBoxTeacher> {
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
        ));
  }
}
