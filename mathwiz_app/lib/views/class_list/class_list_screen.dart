import 'package:flutter/material.dart';
import 'package:mathwiz_app/constants.dart';
import 'package:mathwiz_app/model/class_model.dart';
import 'package:mathwiz_app/views/class_list/create_class_screen.dart';
import 'package:mathwiz_app/views/homepage/teacher/homepage_teacher.dart';
import 'package:mathwiz_app/views/homepage/student/homepage_student.dart';
import 'package:mathwiz_app/widgets/box_button.dart';
import 'package:mathwiz_app/widgets/box_input_field.dart';
import 'package:mathwiz_app/widgets/ham_menu_start.dart';
import 'package:mathwiz_app/widgets/loading_indicator.dart';
import 'package:provider/provider.dart';

class ClassListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final classList = Provider.of<List<ClassModel>>(context) ?? [];

    if (classList.isEmpty) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Class List'),
          backgroundColor: kPrimaryColor,
        ),
        drawer: HamMenuStart(size: size),
        body: LoadingIndicator(),
      );
    } else {
      return Scaffold(
          appBar: AppBar(
            title: Text('Class List'),
            backgroundColor: kPrimaryColor,
          ),
          drawer: HamMenuStart(size: size),
          body: SafeArea(
              child: Column(children: <Widget>[
            SizedBox(
              height: size.height * 0.01,
            ),
            Expanded(
                child: Padding(
              padding: EdgeInsets.only(left: 5, right: 5),
              child: ListView.separated(
                  separatorBuilder: (context, index) {
                    return SizedBox(
                      height: size.height * 0.01,
                    );
                  },
                  itemCount: classList.length,
                  itemBuilder: (context, index) {
                    return InkWell(
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
                          height: size.height * 0.11,
                          child: Column(
                            children: [
                              Text(
                                'Title: ${classList[index].title}',
                                style: TextStyle(
                                    color: kSecondaryColor,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                'Class Code: ${classList[index].code}',
                                style: TextStyle(
                                    color: kSecondaryColor,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ));
                  }),
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
          ])));
    }
  }
}
