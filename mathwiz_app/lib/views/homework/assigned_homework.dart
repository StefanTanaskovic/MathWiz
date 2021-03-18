import 'package:flutter/material.dart';

class AssignedHomeworkScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AssignedHomeworkScreenState();
  }
}

class _AssignedHomeworkScreenState extends State<AssignedHomeworkScreen> {
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
                                    Text("Class Name -",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: size.height * 0.019)),
                                    Text(" Homework #",
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
                                child: Row(
                              children: [
                                Icon(Icons.assignment_late,
                                    color: Colors.orange,
                                    size: size.height * 0.04),
                                SizedBox(
                                  width: size.width * 0.02,
                                ),
                                Icon(Icons.assignment_turned_in,
                                    color: Colors.green,
                                    size: size.height * 0.04),
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
                                    Text("30",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: size.height * 0.03)),
                                    SizedBox(
                                      width: size.width * 0.02,
                                    ),
                                    Icon(Icons.attach_money,
                                        color: Colors.yellow[800],
                                        size: size.height * 0.04),
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
