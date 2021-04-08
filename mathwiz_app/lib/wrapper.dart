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
    FirestoreDatabaseService databaseServiceNotifier =
      Provider.of<FirestoreDatabaseService>(context, listen: true);
    
    if (user == null) {
      return WelcomeScreen();
    } else 
    if(databaseServiceNotifier.classList.isEmpty){
      databaseServiceNotifier.setUser();
      return Text("Loading");
     //databaseServiceNotifier.setClassList();
    }else{
      return ClassListScreen();
    }
  }
}
