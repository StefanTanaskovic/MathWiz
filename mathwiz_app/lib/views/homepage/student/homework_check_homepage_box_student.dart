import 'package:flutter/material.dart';
import 'package:mathwiz_app/views/homepage/student/homework_list.dart';
import '../../../constants.dart';

class HomeworkCheckHomepageBoxStudent extends StatefulWidget {
  @override
  _HomeworkCheckHomepageBoxStudentState createState() => _HomeworkCheckHomepageBoxStudentState();
}

class _HomeworkCheckHomepageBoxStudentState extends State<HomeworkCheckHomepageBoxStudent> {
  _HomeworkCheckHomepageBoxStudentState();

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
            Text('Homework Check',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24.0,
                    color: Colors.white)),

            HomeworkList(),
            SizedBox(height: 10),
          ],

        
        )
    );
  }
}
