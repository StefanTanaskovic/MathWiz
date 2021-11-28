import 'package:flutter/cupertino.dart';
import 'package:mathwiz_app/controllers/homepage_student_controller.dart';
import 'package:mathwiz_app/controllers/main_notifier.dart';
import 'package:mathwiz_app/model/asteroid_model.dart';
import 'package:mathwiz_app/model/race_to_top.dart';
import 'package:mathwiz_app/model/trivia_model.dart';
import 'package:mathwiz_app/services/fs_database.dart';
import 'package:mathwiz_app/views/homepage/student/homepage_student.dart';
import 'package:mathwiz_app/views/homepage/teacher/homepage_teacher.dart';
import 'package:mathwiz_app/views/trivia/race_to_top/r2t_quiz.dart';
import 'package:provider/provider.dart';


class RaceWrapper extends StatefulWidget {
  final RaceTopModel quiz;
  final int index;
   RaceWrapper({this.quiz, this.index});

  @override
  _RaceWrapperState createState() => _RaceWrapperState(quiz: quiz, index: index);
}

class _RaceWrapperState extends State<RaceWrapper> {
  final RaceTopModel quiz;
  final int index;
  _RaceWrapperState({this.quiz,this.index});
  @override
  Widget build(BuildContext context) {
    FirestoreDatabaseService fsDatabase =
          Provider.of<FirestoreDatabaseService>(context, listen: false);
  var rttKey = context.watch<MainNotifier>().buildKey;
  return MultiProvider(
      key: ObjectKey(rttKey),
      providers: [
        StreamProvider<List<RaceTopModel>>.value(
        value: HomepageStudentController(classID: fsDatabase.classID).raceList, initialData: null),
        
      ],
      child: RaceQuizScreen(quiz:quiz ,index:index)
    );
  }


}