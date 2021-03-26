import 'package:flutter/material.dart';
import 'package:mathwiz_app/constants.dart';
import 'package:mathwiz_app/controllers/class_list_notifier.dart';
import 'package:mathwiz_app/views/class_list/create_class_screen.dart';
import 'package:mathwiz_app/views/homepage/homepage_teacher.dart';
import 'package:mathwiz_app/widgets/box_button.dart';
import 'package:mathwiz_app/widgets/box_input_field.dart';
import 'package:mathwiz_app/widgets/ham_menu_start.dart';
import 'package:provider/provider.dart';

class ClassListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context)
        .size; // provides total hieght and width of screen
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
          itemCount: context.watch<ClassListNotifier>().classList.length,
          itemBuilder: (BuildContext context, int index) => InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return HomepageTeacherScreen();
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
                    'Title: ${context.watch<ClassListNotifier>().classList[index].title}',
                    style: TextStyle(
                        color: kSecondaryColor, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Class Code: ${context.watch<ClassListNotifier>().classList[index].id}',
                    style: TextStyle(
                        color: kSecondaryColor, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
          separatorBuilder: (BuildContext context, int index) =>
              const Divider(),
        )
        ),
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
