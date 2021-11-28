import 'package:mathwiz_app/controllers/homepage_student_controller.dart';
import 'package:mathwiz_app/model/asteroid_model.dart';
import 'package:mathwiz_app/services/fs_database.dart';
import 'package:mathwiz_app/views/homepage/student/asteroids_list.dart';
import 'package:provider/provider.dart';
import '../../../constants.dart';
import 'package:flutter/material.dart';

class AsteroidsHomepageBoxStudent extends StatefulWidget {
  @override
  _AsteroidsHomepageBoxStudentState createState() => _AsteroidsHomepageBoxStudentState();
}

class _AsteroidsHomepageBoxStudentState extends State<AsteroidsHomepageBoxStudent> {
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
              Text('Asteroids',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24.0,
                      color: Colors.white)),

              AsteroidsList(),
              SizedBox(height: 10),
            ],
          )
    );
  }
}
