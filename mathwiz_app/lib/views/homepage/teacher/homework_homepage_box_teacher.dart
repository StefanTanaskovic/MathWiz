import 'package:flutter/material.dart';
import 'package:mathwiz_app/controllers/homepage_teacher_controller.dart';
import 'package:mathwiz_app/controllers/publish_homework_notifier.dart';
import 'package:mathwiz_app/model/homework_model.dart';
import 'package:mathwiz_app/views/homepage/teacher/homework_list.dart';
import 'package:mathwiz_app/views/homework/publish_homework.dart';
import 'package:provider/provider.dart';
import '../../../constants.dart';

class HomeworkHomepageBoxTeacher extends StatefulWidget {
  @override
  _HomeworkHomepageBoxTeacherState createState() => _HomeworkHomepageBoxTeacherState();
}

class _HomeworkHomepageBoxTeacherState extends State<HomeworkHomepageBoxTeacher> {
  @override
  Widget build(BuildContext context) {
    final homeworkList = Provider.of<List<HomeworkModel>>(context) ?? [];
    return Container(
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.symmetric(horizontal: 5.0),
        decoration: BoxDecoration(
            border: Border.all(
              color: kPrimaryColor,
            ),
            color: kPrimaryColor,
            borderRadius: BorderRadius.all(Radius.circular(20))),
        child: Column(
          children: <Widget>[
            SizedBox(height: 10),
            Text('Homework Check',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24.0,
                    color: Colors.white)),
                HomeworkList(),
            SizedBox(height: 10),
          ],
        )
    );
  }
}
