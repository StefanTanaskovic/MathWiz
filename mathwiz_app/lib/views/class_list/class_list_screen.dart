import 'package:flutter/material.dart';
import 'package:mathwiz_app/constants.dart';
import 'package:mathwiz_app/controllers/homepage_student_controller.dart';
import 'package:mathwiz_app/controllers/main_notifier.dart';
import 'package:mathwiz_app/model/asteroid_model.dart';
import 'package:mathwiz_app/services/fs_database.dart';
import 'package:mathwiz_app/views/class_list/class_list_wrapper.dart';
import 'package:mathwiz_app/views/class_list/create_class_screen.dart';
import 'package:mathwiz_app/views/homepage/student/homepage_student.dart';
import 'package:mathwiz_app/views/homepage/teacher/homepage_teacher.dart';
import 'package:mathwiz_app/widgets/box_button.dart';
import 'package:mathwiz_app/widgets/box_input_field.dart';
import 'package:mathwiz_app/widgets/ham_menu_start.dart';
import 'package:mathwiz_app/widgets/loading_indicator.dart';
import 'package:provider/provider.dart';

class ClassListScreen extends StatefulWidget {
  @override
  State<ClassListScreen> createState() => _ClassListScreenState();
}

class _ClassListScreenState extends State<ClassListScreen> {
  String _code;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

      FirestoreDatabaseService fsDatabase =
          Provider.of<FirestoreDatabaseService>(context, listen: false);
      final classList = fsDatabase.classList;
      if(context.watch<FirestoreDatabaseService>().user == null){
        print("type null");
        return LoadingIndicator();
      }else{
        print(fsDatabase.user.type);
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
                  itemCount: context.watch<FirestoreDatabaseService>().classList.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                        onTap: () {
                          fsDatabase.getClassAvatars(index).then((value) {
                              MainNotifier mainNotifier = Provider.of<MainNotifier>(context,listen: false);
                              mainNotifier.getNewBuildKey();
                              fsDatabase.setClassID(index);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                    return ClassListWrapper(index: index);
                                },
                              ),
                            );
                          });
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
            if(fsDatabase.user.type == 'Student')
              Form(
                key: _formKey,
                child: BoxInputFeild(
                  icon: Icons.assignment,
                  hintText: 'Class Code',
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter a class code';
                    }
                    return null;
                    },
                onSaved: (value) {
                  _code = value.toString();
                },
                onChanged: (value) {},
                ),
              ),
            BoxButton(
              text: "Add Class",
              color: kPrimaryColor,
              press: () {
                  if(fsDatabase.user.type == 'Teacher'){
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                            return CreateClassScreen();
                        },
                      ),
                    );
                  }else{
                  if (_formKey.currentState.validate()) {
                  _formKey.currentState.save();
                    fsDatabase.addClassCode(_code);
                    setState(() {

                    });
                  }
                }
              },
            ),
            SizedBox(
              height: size.height * 0.05,
            ),
          ])));
      }

    }
  }

