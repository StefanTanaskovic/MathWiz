import 'package:flutter/material.dart';
import 'package:mathwiz_app/model/user.dart';
import 'package:mathwiz_app/services/fs_database.dart';
import 'package:mathwiz_app/views/class_list/class_list_screen.dart';
import 'package:mathwiz_app/views/welcome_screen.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    UserModel user = Provider.of<UserModel>(context);
    if (user == null) {
      return WelcomeScreen();
    } else {
      FirestoreDatabaseService fsDatabase =
          Provider.of<FirestoreDatabaseService>(context, listen: false);
      fsDatabase.setUser();
      return ClassListScreen();
    }
  }
}
