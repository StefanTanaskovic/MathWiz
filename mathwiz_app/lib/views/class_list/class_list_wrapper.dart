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

class ClassListWrapper extends StatefulWidget {
  final int index;

   ClassListWrapper({this.index});

  @override
  _ClassListWrapperState createState() => _ClassListWrapperState(index: index);
}

class _ClassListWrapperState extends State<ClassListWrapper> {
  final int index;

  _ClassListWrapperState({this.index});
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
        
        StreamProvider<List<AsteroidModel>>.value(
        value: HomepageStudentController(classID: fsDatabase.classID).asteroidsList, initialData: null),
        
        StreamProvider<List<TriviaModel>>.value(
        value: HomepageStudentController(classID: fsDatabase.classID).triviaList, initialData: null),
      ],
      child: chooseHome()
    );
  }

  chooseHome() {
    FirestoreDatabaseService fsDatabase =
      Provider.of<FirestoreDatabaseService>(context, listen: false);
  if(fsDatabase.user.type == 'Student'){
    return HomepageStudentScreen(index: index);
  }else{
    return HomepageTeacherScreen(index: index);
  }
  }
}