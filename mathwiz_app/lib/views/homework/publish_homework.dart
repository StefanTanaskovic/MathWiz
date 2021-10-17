import 'package:flutter/material.dart';
import 'package:mathwiz_app/model/homework_model.dart';
import 'package:mathwiz_app/controllers/publish_homework_notifier.dart';
import 'package:mathwiz_app/views/homepage/teacher/homepage_teacher.dart';
import 'package:mathwiz_app/controllers/homepage_teacher_controller.dart';
import 'dart:ui' as ui;
import 'package:mathwiz_app/widgets/box_button.dart';
import 'package:mathwiz_app/widgets/box_input_field.dart';
import 'package:provider/provider.dart';
import '../../constants.dart';

class PublishHomeworkScreen extends StatefulWidget {
  final HomeworkModel homework;
  PublishHomeworkScreen({this.homework});

  @override
  State<StatefulWidget> createState() {
    return _PublishHomeworkScreenState(homework: homework);
  }
}

List<Widget> children;

class _PublishHomeworkScreenState extends State<PublishHomeworkScreen> {
  
  final myController = TextEditingController();
  HomeworkModel homework;
  int goldAmount;
  String homeworkDescription;
  String homeworkTitle;


  _PublishHomeworkScreenState({this.homework});

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    HomeworkListNotifier homeworkListNotifier =
    Provider.of<HomeworkListNotifier>(context,listen: false); 

    ui.Size size = MediaQuery.of(context)
        .size;// provides total hieght and width of screen
    return Scaffold(
      appBar: AppBar(
        title: Text("Publish Homework",
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
              Text(widget.homework.ocrtext.isEmpty ? 'No text found': widget.homework.ocrtext,
              style: TextStyle(fontSize: 20),),
              BoxInputFeild(
                hintText: "Title",
                icon: Icons.title,
                onChanged: (value) {
                homeworkTitle = value;
                print(goldAmount);
                },
              ),
              BoxInputFeild(
                hintText: "Coins",
                icon: Icons.attach_money,
                onChanged: (value) {
                goldAmount = int.parse(value);
                print(goldAmount);
                },
              ),
              Container(
                width: size.width * 0.8,
                child: TextField(
                  controller: myController,
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: kPrimaryColor)),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: kPrimaryColor)),
                      hintText: 'Description'),
                  maxLines: 5,
                  onChanged: (value) {
                    this.homeworkDescription = myController.text;
                  }
                ),
              ),
              BoxButton(
                text: "Save To Drafts",
                press: () {
                    homeworkListNotifier.save(
                    "Drafts", 
                    HomeworkModel(
                    title: homeworkTitle, 
                    status: "Drafts",
                    gold:goldAmount, 
                    description: myController.text)
                  );
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return HomepageTeacherScreen();
                        },
                      ),
                    );
                }
              ),
              BoxButton(
                text: "Publish",
                press: () {
                    homeworkTitle = 
                    homeworkListNotifier.save(
                    "Publish", 
                    HomeworkModel(
                    title: homeworkTitle, 
                    status: "Publish",
                    gold:goldAmount, 
                    description: myController.text)
                  );
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