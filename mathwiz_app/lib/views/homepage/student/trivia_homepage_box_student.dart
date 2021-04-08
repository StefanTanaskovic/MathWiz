import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mathwiz_app/controllers/homepage_student_controller.dart';
import 'package:mathwiz_app/views/homepage/student/trivia_list.dart';

import '../../../constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:mathwiz_app/controllers/trivia_activity_notifier.dart';
import 'package:mathwiz_app/views/trivia/trivia_activity/trivia_quiz_screen.dart';


class TriviaHomepageBoxStudent extends StatefulWidget {
  @override
  _TriviaHomepageBoxStudentState createState() => _TriviaHomepageBoxStudentState();
}

class _TriviaHomepageBoxStudentState extends State<TriviaHomepageBoxStudent> {
   @override
  Widget build(BuildContext context) {
    

    return StreamProvider<QuerySnapshot>.value(
      value: HomepageStudentController().triviaList,
      initialData: null,
      child: Container(
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
              Text('Trivia',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24.0,
                      color: Colors.white)),

              TriviaList(),
              SizedBox(height: 10),
            ],
          )
      ),
    );
  }
}
