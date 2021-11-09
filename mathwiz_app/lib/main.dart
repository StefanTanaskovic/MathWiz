import 'package:flutter/material.dart';
import 'package:mathwiz_app/controllers/avatar_notifier.dart';
import 'package:mathwiz_app/controllers/class_list_notifier.dart';
import 'package:mathwiz_app/controllers/publish_homework_notifier.dart';
import 'package:mathwiz_app/model/asteroid_model.dart';
import 'package:mathwiz_app/controllers/achievement_notifier.dart';
import 'package:mathwiz_app/model/class_model.dart';
import 'package:mathwiz_app/model/race_to_top.dart';
import 'package:mathwiz_app/model/trivia_model.dart';
import 'package:mathwiz_app/model/user.dart';
import 'package:mathwiz_app/services/auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:mathwiz_app/services/fs_database.dart';
import 'package:mathwiz_app/wrapper.dart';
import 'package:provider/provider.dart';
import 'constants.dart';

import 'controllers/homepage_student_controller.dart';
import 'controllers/race_to_top_creator_notifier.dart';
import 'controllers/trivia_activity_notifier.dart';
import 'model/achievement_model.dart';
import 'model/homework_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => FirestoreDatabaseService()),
    ChangeNotifierProvider(create: (_) => RaceListNotifier()),
    ChangeNotifierProvider(create: (_) => TriviaListNotifier()),
    ChangeNotifierProvider(create: (_) => AvatarNotifier()),
    ChangeNotifierProvider(create: (_) => HomeworkListNotifier()),
    StreamProvider<UserModel>.value(
        value: AuthService().user,
        initialData: null,
        updateShouldNotify: (_, __) => true),
    StreamProvider<List<TriviaModel>>.value(
        value: HomepageStudentController().triviaList, initialData: null),
    StreamProvider<List<AsteroidModel>>.value(
        value: HomepageStudentController().asteroidsList, initialData: null),
    StreamProvider<List<RaceTopModel>>.value(
        value: HomepageStudentController().raceList, initialData: null),
    StreamProvider<List<HomeworkModel>>.value(
        value: HomepageStudentController().homeworksList, initialData: null),
    StreamProvider<List<AchievementModel>>.value(
        value: HomepageStudentController().achievementList, initialData: null),
    StreamProvider<List<ClassModel>>.value(
        value: ClassListNotifier().classList, initialData: null),
    ChangeNotifierProvider(create: (_) => FirestoreDatabaseService()),
    ChangeNotifierProvider(create: (_) => RaceListNotifier()),
    ChangeNotifierProvider(create: (_) => TriviaListNotifier()),
    ChangeNotifierProvider(create: (_) => AvatarNotifier()),
    ChangeNotifierProvider(create: (_) => HomeworkListNotifier()),
    ChangeNotifierProvider(create: (_) => AchievementNotifier()),
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MathWiz',
      theme: ThemeData(
          primaryColor: kPrimaryColor,
          scaffoldBackgroundColor: kBackgroundColor),
      home: Wrapper(),
    );
  }
}
