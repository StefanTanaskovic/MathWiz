import 'package:flutter/material.dart';
import 'package:mathwiz_app/views/welcome_screen.dart';

import 'constants.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  //SharedPreferences.getInstance().then((prefs) {});
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  //final SharedPreferences prefs;

  //const MyApp({Key key, this.prefs}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MathWiz',
      theme: ThemeData(
          primaryColor: kPrimaryColor,
          scaffoldBackgroundColor: kBackgroundColor),
      home: WelcomeScreen(),
    );
  }
}
