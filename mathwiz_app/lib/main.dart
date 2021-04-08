import 'package:flutter/material.dart';
import 'package:mathwiz_app/controllers/avatar_notifier.dart';
import 'package:mathwiz_app/controllers/class_list_notifier.dart';
import 'package:mathwiz_app/model/user.dart';
import 'package:mathwiz_app/services/auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:mathwiz_app/services/fs_database.dart';
import 'package:mathwiz_app/wrapper.dart';
import 'package:provider/provider.dart';
import 'constants.dart';

import 'controllers/race_to_top_creator_notifier.dart';
import 'controllers/trivia_activity_notifier.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MultiProvider(providers: [
    StreamProvider<UserModel>.value(
        value: AuthService().user,
        initialData: null,
        updateShouldNotify: (_, __) => true),
    ChangeNotifierProvider(create: (_) => FirestoreDatabaseService()),
    ChangeNotifierProvider(create: (_) => RaceListNotifier()),
    ChangeNotifierProvider(create: (_) => TriviaListNotifier()),
    ChangeNotifierProvider(create: (_) => AvatarNotifier()),
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
