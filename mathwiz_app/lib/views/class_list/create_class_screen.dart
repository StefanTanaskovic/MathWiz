/*

- Class ID
- Title / Class Name
- Description
- Teachers Name

*/

import 'package:flutter/material.dart';
import 'package:mathwiz_app/constants.dart';
import 'package:mathwiz_app/widgets/box_button.dart';
import 'package:mathwiz_app/widgets/box_input_field.dart';
import 'package:mathwiz_app/widgets/ham_menu_start.dart';

class CreateClassScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context)
        .size; // provides total hieght and width of screen
    return Scaffold(
        appBar: AppBar(
          title: Text('Create New Class'),
          backgroundColor: kPrimaryColor,
        ),
        body: SafeArea(
          child: Align(
            alignment: Alignment.center,
            child: Column(children: <Widget>[
              BoxInputFeild(
                icon: Icons.assignment,
                hintText: 'Teachers Name',
              ),
              BoxInputFeild(
                icon: Icons.assignment,
                hintText: 'Class Name',
              ),
              BoxInputFeild(
                icon: Icons.assignment,
                hintText: 'Class Description',
              ),
              BoxButton(
                text: "Create Class",
                color: kPrimaryColor,
                press: () {},
              ),
            ]),
          ),
        ));
  }
}
