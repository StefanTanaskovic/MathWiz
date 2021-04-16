import 'package:flutter/material.dart';
import 'package:mathwiz_app/constants.dart';
import 'package:mathwiz_app/controllers/class_list_notifier.dart';
import 'package:mathwiz_app/model/class_model.dart';
import 'package:mathwiz_app/widgets/box_button.dart';
import 'package:mathwiz_app/widgets/text_field_container.dart';
import 'package:provider/provider.dart';
import 'package:random_string/random_string.dart';
import 'dart:math' show Random;

class CreateClassScreen extends StatefulWidget {
  @override
  _CreateClassScreenState createState() => _CreateClassScreenState();
}

class _CreateClassScreenState extends State<CreateClassScreen> {
  final _classFormKey = GlobalKey<FormState>();

  String _title;
  String _description;
  String _teacher;

  @override
  Widget build(BuildContext context) {
  final classList = Provider.of<List<ClassModel>>(context) ?? [];
    return Scaffold(
        appBar: AppBar(
          title: Text('Create New Class'),
          backgroundColor: kPrimaryColor,
        ),
        body: SafeArea(
          child: Align(
            alignment: Alignment.center,
            child: Form(
              key: _classFormKey,
              child: Column(children: [
                TextFeildContainer(
                  child: TextFormField(
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please Enter a Title';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _title = value;
                    },
                    decoration: InputDecoration(
                      icon: Icon(
                        Icons.assignment,
                        color: kPrimaryColor,
                      ),
                      hintText: "Title",
                      border: InputBorder.none,
                    ),
                  ),
                ),
                TextFeildContainer(
                  child: TextFormField(
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please Enter a Teacher Name';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _teacher = value;
                    },
                    decoration: InputDecoration(
                      icon: Icon(
                        Icons.person,
                        color: kPrimaryColor,
                      ),
                      hintText: "Teacher's Name",
                      border: InputBorder.none,
                    ),
                  ),
                ),
                BoxButton(
                    text: "Create Class",
                    press: () {
                      if (!_classFormKey.currentState.validate()) return;
                      _classFormKey.currentState.save();
                      classList.add(ClassModel(
                          code: randomAlpha(6),
                          title: _title,
                          teacher: _teacher,
                          stundetIDs: []
                      ));
                      ClassModel newClass = ClassModel(
                          code: randomAlpha(6),
                          title: _title,
                          teacher: _teacher,
                          stundetIDs: []
                          );
                      classList.add(newClass);
                      ClassListNotifier().addClass(newClass);
                    }),
              ]),
            ),
          ),
        ));
  }
}
