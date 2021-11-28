import 'package:flutter/cupertino.dart';
import 'package:mathwiz_app/controllers/homepage_student_controller.dart';
import 'package:mathwiz_app/controllers/main_notifier.dart';
import 'package:mathwiz_app/model/asteroid_model.dart';
import 'package:mathwiz_app/model/race_to_top.dart';
import 'package:mathwiz_app/model/trivia_model.dart';
import 'package:mathwiz_app/services/fs_database.dart';
import 'package:mathwiz_app/views/homepage/student/homepage_student.dart';
import 'package:mathwiz_app/views/homepage/teacher/homepage_teacher.dart';
import 'package:provider/provider.dart';

import 'asteroids_quiz.dart';

class AsteroidsWrapper extends StatefulWidget {
  final AsteroidModel quiz;
  final index;
   AsteroidsWrapper({this.quiz, this.index});

  @override
  _AsteroidsWrapperState createState() => _AsteroidsWrapperState(quiz: quiz, index: index);
}

class _AsteroidsWrapperState extends State<AsteroidsWrapper> {
  final AsteroidModel quiz;
  final int index;
  _AsteroidsWrapperState({this.quiz,this.index});
  @override
  Widget build(BuildContext context) {
    FirestoreDatabaseService fsDatabase =
          Provider.of<FirestoreDatabaseService>(context, listen: false);
  var rttKey = context.watch<MainNotifier>().buildKey;
  return MultiProvider(
      key: ObjectKey(rttKey),
      providers: [
        StreamProvider<List<AsteroidModel>>.value(
        value: HomepageStudentController(classID: fsDatabase.classID).asteroidsList, initialData: null),
        
      ],
      child: AsteroidsQuizScreen(quiz:quiz, index: index)
    );
  }


}