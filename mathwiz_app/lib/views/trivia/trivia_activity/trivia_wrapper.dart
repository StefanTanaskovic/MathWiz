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
import 'package:mathwiz_app/views/trivia/trivia_activity/trivia_creator.dart';
import 'package:mathwiz_app/views/trivia/trivia_activity/trivia_quiz_screen.dart';
import 'package:provider/provider.dart';

class TriviaWrapper extends StatefulWidget {
  final TriviaModel quiz;
  final int index;
   TriviaWrapper({this.quiz, this.index});

  @override
  _TriviaWrapperState createState() => _TriviaWrapperState(quiz: quiz, index: index);
}

class _TriviaWrapperState extends State<TriviaWrapper> {
  final TriviaModel quiz;
  final int index;
  _TriviaWrapperState({this.quiz,this.index});
  @override
  Widget build(BuildContext context) {
    FirestoreDatabaseService fsDatabase =
          Provider.of<FirestoreDatabaseService>(context, listen: false);
  var rttKey = context.watch<MainNotifier>().buildKey;
  return MultiProvider(
      key: ObjectKey(rttKey),
      providers: [
        StreamProvider<List<TriviaModel>>.value(
        value: HomepageStudentController(classID: fsDatabase.classID).triviaList, initialData: null),
      ],
      child: TriviaQuizScreen(quiz:quiz ,index:index)
    );
  }
}