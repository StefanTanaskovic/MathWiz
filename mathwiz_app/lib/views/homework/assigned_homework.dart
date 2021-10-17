import 'package:flutter/material.dart';
import 'package:mathwiz_app/controllers/publish_homework_notifier.dart';
import 'package:mathwiz_app/model/homework_model.dart';
import 'package:provider/src/provider.dart';

class AssignedHomeworkScreen extends StatefulWidget {

  final HomeworkModel homework;
  AssignedHomeworkScreen({this.homework});
  @override
  State<StatefulWidget> createState() {
    return _AssignedHomeworkScreenState(homework:homework);
  }
}

class _AssignedHomeworkScreenState extends State<AssignedHomeworkScreen> {

  HomeworkModel homework;
  _AssignedHomeworkScreenState({this.homework});
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context)
        .size; // provides total hieght and width of screen
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Assigned Homework",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: size.height * 0.025,
              color: Colors.black),
        ),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey[500], width: 2.0)),
                padding: const EdgeInsets.all(5),
                child: Row(
                  children: [
                    Container(
                        width: size.width / 1.61,
                        height: size.height * 0.22,
                        child: Column(
                          children: [
                            Container(
                                child: Stack(
                              children: [
                                Row(
                                  children: [
                                    Text('${homework.title}',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: size.height * 0.019)),
                                  ],
                                )
                              ],
                            )),
                            SizedBox(
                              height: size.height * 0.02,
                            ),
                                                        Container(
                                child: Stack(
                              children: [
                                Row(
                                  children: [
                                    Text('${homework.ocrtext}',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: size.height * 0.019)),
                                  ],
                                )
                              ],
                            )),
                            SizedBox(
                              height: size.height * 0.02,
                            ),
                            Container(
                                child: Stack(
                              children: [
                                Row(
                                  children: [
                                    Text('${homework.gold}',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: size.height * 0.019)),
                                    SizedBox(
                                      width: size.width * 0.02,
                                    ),
                                    Icon(Icons.attach_money,
                                        color: Colors.yellow[800],
                                        size: size.height * 0.02),
                                  ],
                                )
                              ],
                            )),
                            SizedBox(
                              height: size.height * 0.02,
                            ),
                            Container(
                                child: Stack(
                              children: [
                                Row(
                                  children: [
                                    Text('${homework.description}',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: size.height * 0.019)),
                                  ],
                                )
                              ],
                            )),
                            SizedBox(
                              height: size.height * 0.02,
                            ),
                            Container(
                              child: Stack(
                              children: [
                                Row(
                                  children: [
                                    Icon(Icons.thumb_up,
                                        color: Colors.blue[800],
                                        size: size.height * 0.04),
                                    SizedBox(
                                      width: size.width * 0.02,
                                    ),
                                    Icon(Icons.thumb_down,
                                        color: Colors.red,
                                        size: size.height * 0.04),
                                  ],
                                )
                              ],
                            )),
                          ],
                        )),
                    Container(
                        child: Column(
                      children: [
                        Image.asset(
                          "assets/images/math-placeholder.jpg",
                          height: size.height * 0.2,
                        )
                      ],
                    ))
                  ],
                )),
            SizedBox(
              height: size.height * 0.03,
            ),
          ],
        ),
      ),
    );
  }
}
