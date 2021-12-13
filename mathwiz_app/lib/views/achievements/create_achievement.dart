import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:mathwiz_app/views/homepage/teacher/homepage_teacher.dart';
import 'package:mathwiz_app/controllers/achievement_notifier.dart';
import 'package:mathwiz_app/widgets/box_button.dart';
import 'package:mathwiz_app/model/achievement_model.dart';
import 'package:mathwiz_app/widgets/box_input_field.dart';
import 'package:provider/provider.dart';

import '../../constants.dart';

class CreateAchievementScreen extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _CreateAchievementScreenState();
  }
}

class _CreateAchievementScreenState extends State<CreateAchievementScreen> {
  var progress = 0;
  int points;
  String achievementTitle;


  @override
   Widget build(BuildContext context) {
    AchievementNotifier achievementNotifier =
    Provider.of<AchievementNotifier>(context,listen: false); 

    ui.Size size = MediaQuery.of(context)
        .size;// provides total hieght and width of screen
    return Scaffold(
      appBar: AppBar(
        title: Text("Create Achievement",
            style: TextStyle(
              fontSize: 20,
            )),
        backgroundColor: kPrimaryColor,
      ),
      body: SafeArea(
        child: Align(
          alignment: Alignment.center,
          child: Column(
            children: [
              BoxInputFeild(
                hintText: "Achievement Title",
                icon: Icons.title,
                onChanged: (value) {
                achievementTitle = value;
                },
              ),
              BoxInputFeild(
                hintText: "Achievement Point Goal",
                icon: Icons.auto_awesome,
                onChanged: (value) {
                points = int.parse(value);
                },
              ),
              BoxButton(
                text: "Create",
                press: () {
                    achievementNotifier.save(
                    AchievementModel(
                    title: achievementTitle, 
                    pointsMax: points,
                    currentPoints: 0)
                  ); 
                },
              ),
              SizedBox(
                height: size.height * 0.03,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
