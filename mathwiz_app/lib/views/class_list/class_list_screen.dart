import 'package:flutter/material.dart';
import 'package:mathwiz_app/constants.dart';
import 'package:mathwiz_app/views/class_list/create_class_screen.dart';
import 'package:mathwiz_app/views/homepage/homepage_teacher.dart';
import 'package:mathwiz_app/widgets/box_button.dart';
import 'package:mathwiz_app/widgets/box_input_field.dart';
import 'package:mathwiz_app/widgets/ham_menu_start.dart';

final List<String> classList = <String>['Class A', 'Class B', 'Class C'];

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
          itemCount: classList.length,
          itemBuilder: (BuildContext context, int index) => InkWell(
            onTap: () {
              print("Tapped " + classList[index]);
              _showMyDialog(context, index);
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
              child: Center(
                  child: Text(
                '${classList[index]}',
                style: TextStyle(
                    color: kSecondaryColor, fontWeight: FontWeight.bold),
              )),
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

Future<void> _showMyDialog(context, index) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('You just tapped ' + classList[index]),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text('Later, tapping the class will take you to its page.'),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: Text('View Sample Page'),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return HomepageTeacherScreen();
                  },
                ),
              );
            },
          ),
          TextButton(
            child: Text('Ok!'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
