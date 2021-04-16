import 'package:mathwiz_app/views/homepage/student/trivia_list.dart';
import '../../../constants.dart';
import 'package:flutter/material.dart';



class TriviaHomepageBoxStudent extends StatefulWidget {
  @override
  _TriviaHomepageBoxStudentState createState() => _TriviaHomepageBoxStudentState();
}

class _TriviaHomepageBoxStudentState extends State<TriviaHomepageBoxStudent> {
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
    );
  }
}
