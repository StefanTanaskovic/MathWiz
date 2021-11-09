import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:mathwiz_app/views/homework/completed_homework.dart';
import 'package:mathwiz_app/views/homework/create_homework.dart';
import 'package:mathwiz_app/views/achievements/create_achievement.dart';
import 'package:mathwiz_app/views/trivia/race_to_top/r2t_prev.dart';
import 'package:mathwiz_app/views/trivia/trivia_activity/trivia_prev.dart';
import 'package:mathwiz_app/widgets/ham_menu.dart';
import 'package:mathwiz_app/views/homepage/teacher/homework_homepage_box_teacher.dart';
import 'package:mathwiz_app/views/homepage/teacher/race_to_top_homepage_box_teacher.dart';
import 'package:mathwiz_app/views/homepage/teacher/trivia_homepage_box_teacher.dart';
import 'package:mathwiz_app/views/homepage/teacher/achievement_homepage_box_teacher.dart';
import '../../../constants.dart';

class HomepageTeacherScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomepageTeacherScreenState();
  }
}

class _HomepageTeacherScreenState extends State<HomepageTeacherScreen> {
  int _current = 0;
  final List<Widget> items = [
    HomeworkHomepageBoxTeacher(),
    RaceToTopHomepageBoxTeacher(),
    TriviaHomepageBoxTeacher(),
    AchievementHomepageBoxTeacher()

  ];
  bool dialVisible = true;
  ScrollController scrollController;
  @override
  void initState() {
    super.initState();

    scrollController = ScrollController()
      ..addListener(() {
        setDialVisible(scrollController.position.userScrollDirection ==
            ScrollDirection.forward);
      });
  }

  void setDialVisible(bool value) {
    setState(() {
      dialVisible = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
        appBar: AppBar(
          title: Text("Math Class Grade 8 - Mr. Stefan",
              style: TextStyle(
                fontSize: 16,
              )),
          backgroundColor: kPrimaryColor,
        ),
        drawer: HamMenu(size: size),
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                margin: const EdgeInsets.only(top: 10.0),
                height: size.height * 0.45,
                child: GridView.count(
                  mainAxisSpacing: 1,
                  crossAxisSpacing: 1,
                  crossAxisCount: 6,
                  children: List.generate(30, (index) {
                    return Align(
                        child: Container(
                      height: 60,
                      width: 60,
                      child: Card(
                        semanticContainer: true,
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        child: Image.asset(
                          'assets/images/avatar.png',
                          fit: BoxFit.fill,
                        ),
                      ),
                    ));
                  }),
                ),
              ),
              CarouselSlider(
                  options: CarouselOptions(
                      height: 260.0,
                      onPageChanged: (index, reason) {
                        setState(() {
                          _current = index;
                        });
                      }),
                  items: items),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: items.map((url) {
                  int index = items.indexOf(url);
                  return Container(
                    width: 8.0,
                    height: 8.0,
                    margin:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _current == index
                          ? Color.fromRGBO(0, 0, 0, 0.9)
                          : Color.fromRGBO(0, 0, 0, 0.4),
                    ),
                  );
                }).toList(),
              ),
            ],
          ),
        ),
        floatingActionButton: buildSpeedDial());
  }

  SpeedDial buildSpeedDial() {
    return SpeedDial(
      marginEnd: 18,
      marginBottom: 20,
      icon: Icons.add,
      activeIcon: Icons.remove,
      buttonSize: 56.0,
      visible: true,
      closeManually: false,
      curve: Curves.bounceIn,
      overlayColor: Colors.black,
      overlayOpacity: 0.5,
      // onOpen: () => print('OPENING DIAL'),
      // onClose: () => print('DIAL CLOSED'),
      tooltip: 'Speed Dial',
      heroTag: 'speed-dial-hero-tag',
      backgroundColor: kSecondaryColor,
      foregroundColor: Colors.white,
      elevation: 8.0,
      shape: CircleBorder(),
      children: [
          SpeedDialChild(
          child: Icon(
            Icons.assignment_outlined,
            color: Colors.white,
          ),
          backgroundColor: kPrimaryColor,
          label: 'Completed Homework',
          labelStyle: TextStyle(fontSize: 18.0),
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return CompletedHomeworkScreen();
              },
            ),
          ),
        ),
        SpeedDialChild(
          child: Icon(
            Icons.auto_awesome,
            color: Colors.white,
          ),
          backgroundColor: kPrimaryColor,
          label: 'Achievements',
          labelStyle: TextStyle(fontSize: 18.0),
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return CreateAchievementScreen();
              },
            ),
          ),
        ),
        SpeedDialChild(
          child: Icon(
            Icons.assignment_outlined,
            color: Colors.white,
          ),
          backgroundColor: kPrimaryColor,
          label: 'Homework Checker',
          labelStyle: TextStyle(fontSize: 18.0),
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return CreateHomeworkScreen();
              },
            ),
          ),
        ),
        SpeedDialChild(
          child: Icon(
            Icons.question_answer_outlined,
            color: Colors.white,
          ),
          backgroundColor: kSecondaryColor,
          label: 'Trivia',
          labelStyle: TextStyle(fontSize: 18.0),
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return TriviaScreenPicker();
              },
            ),
          ),
        ),
        SpeedDialChild(
          child: Icon(
            Icons.access_alarms_outlined,
            color: Colors.white,
          ),
          backgroundColor: kPrimaryColor,
          label: 'Race to the Top',
          labelStyle: TextStyle(fontSize: 18.0),
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return RaceScreenPicker();
              },
            ),
          ),
        ),
      ],
    );
  }
}
