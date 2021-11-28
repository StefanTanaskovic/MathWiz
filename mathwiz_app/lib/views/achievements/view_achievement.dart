import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import '../../constants.dart';

class ViewAchievementScreen extends StatefulWidget {

  final String achievementTitle;
  final int pointsMax;
  final int currentPoints;
  ViewAchievementScreen({Key key, @required this.achievementTitle, @required this.pointsMax, @required this.currentPoints}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _ViewAchievementScreenState(this.currentPoints,this.pointsMax,this.achievementTitle);
  }
}

List<Widget> children;

class _ViewAchievementScreenState extends State<ViewAchievementScreen> {

  final String achievementTitle;
  final int pointsMax;
  final int currentPoints;

  _ViewAchievementScreenState(this.currentPoints, this.pointsMax, this.achievementTitle);
  @override
   Widget build(BuildContext context) {
    ui.Size size = MediaQuery.of(context)
        .size;// provides total hieght and width of screen
    return Scaffold(
      appBar: AppBar(
        title: Text("Achievement Progress",
            style: TextStyle(
              fontSize: 20,
            )),
        backgroundColor: kPrimaryColor,
      ),
      body: SafeArea(
        child: Align(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(achievementTitle,style: TextStyle(fontSize: 30)),
              SizedBox(
                height: size.height * 0.03,
              ),
              CircularPercentIndicator(
                radius: 240.0,
                lineWidth: 15.0,
                percent: (this.currentPoints/this.pointsMax),
                animation: true,
                animationDuration: 1500,
                center: new Text("${((this.currentPoints/this.pointsMax) * 100).toInt()}%",style: TextStyle(fontSize: 30)),
                progressColor: Colors.green,
              ),
              SizedBox(
                height: size.height * 0.03,
              ),
              if (this.currentPoints > this.pointsMax)
              Text("${this.currentPoints} / ${this.pointsMax}",style: TextStyle(fontSize: 30)),
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
