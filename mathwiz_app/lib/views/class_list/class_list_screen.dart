import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mathwiz_app/constants.dart';
import 'package:mathwiz_app/controllers/class_list_notifier.dart';
import 'package:mathwiz_app/model/class_model.dart';
import 'package:mathwiz_app/model/user.dart';
import 'package:mathwiz_app/services/fs_database.dart';
import 'package:mathwiz_app/views/class_list/create_class_screen.dart';
import 'package:mathwiz_app/views/homepage/student/homepage_student.dart';
import 'package:mathwiz_app/views/homepage/teacher/homepage_teacher.dart';
import 'package:mathwiz_app/widgets/box_button.dart';
import 'package:mathwiz_app/widgets/box_input_field.dart';
import 'package:mathwiz_app/widgets/ham_menu_start.dart';
import 'package:provider/provider.dart';

class ClassListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    if(context.watch<FirestoreDatabaseService>().classList == null){
      return Scaffold(
        appBar: AppBar(
        title: Text('Class List'),
        backgroundColor: kPrimaryColor,
      ),
      body: Text("Loading"),
      );
    }else{
      return Scaffold(
        appBar: AppBar(
          title: Text('Class List'),
          backgroundColor: kPrimaryColor,
        ),
        drawer: HamMenuStart(size: size),
        body: SafeArea(
            child: Column(children: <Widget>[
          Expanded(
              child: ListView.separated(
            padding: const EdgeInsets.all(8),
            itemCount: context.watch<FirestoreDatabaseService>().classList.length,
            itemBuilder: (BuildContext context, int index) => InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return HomepageStudentScreen();
                    },
                  ),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: kSecondaryColor,
                  ),
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                height: size.height * 0.1,
                child: Column(
                  children: [
                    Text(
                      'Title: ${context.watch<FirestoreDatabaseService>().classList[index].title}',
                      style: TextStyle(
                          color: kSecondaryColor, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Class Code: ${context.watch<FirestoreDatabaseService>().classList[index].code}',
                      style: TextStyle(
                          color: kSecondaryColor, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
            separatorBuilder: (BuildContext context, int index) =>
                const Divider(),
          )),
          BoxInputFeild(
            icon: Icons.assignment,
            hintText: 'Class Code',
          ),
          BoxButton(
            text: "Add Class",
            color: kPrimaryColor,
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return CreateClassScreen();
                  },
                ),
              );
            },
          ),
          SizedBox(
            height: size.height * 0.05,
          ),
        ])),
    );
    }
  }
}
