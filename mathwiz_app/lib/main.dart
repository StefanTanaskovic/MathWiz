import 'package:flutter/material.dart';
import 'package:mathwiz_app/controllers/class_list_notifier.dart';
import 'package:mathwiz_app/model/user.dart';
import 'package:mathwiz_app/services/auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:mathwiz_app/views/welcome_screen.dart';
import 'package:mathwiz_app/wrapper.dart';
import 'package:provider/provider.dart';
import 'constants.dart';
import 'controllers/race_to_top_creator_notifier.dart';
import 'controllers/trivia_activity_notifier.dart';

import 'package:firebase_core/firebase_core.dart'; // new
import 'package:firebase_auth/firebase_auth.dart'; // new
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart'; // new

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MultiProvider(providers: [
    StreamProvider<UserModel>.value(value: AuthService().user, initialData: null,updateShouldNotify: (_, __) => true),
    ChangeNotifierProvider(create: (_) => ClassListNotifier()),
    ChangeNotifierProvider(create: (_) => RaceListNotifier()),
    ChangeNotifierProvider(create: (_) => TriviaListNotifier()),
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
