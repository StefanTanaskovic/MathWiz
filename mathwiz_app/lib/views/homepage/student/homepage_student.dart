import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:mathwiz_app/controllers/homepage_student_controller.dart';
import 'package:mathwiz_app/controllers/main_notifier.dart';
import 'package:mathwiz_app/model/asteroid_model.dart';
import 'package:mathwiz_app/model/race_to_top.dart';
import 'package:mathwiz_app/model/trivia_model.dart';
import 'package:mathwiz_app/services/fs_database.dart';
import 'package:mathwiz_app/views/homepage/student/asteroids_homepage_box_student.dart';
import 'package:mathwiz_app/views/homepage/student/achievement_homepage_box_student.dart';
import 'package:mathwiz_app/widgets/ham_menu.dart';
import 'package:mathwiz_app/views/homepage/student/homework_check_homepage_box_student.dart';
import 'package:mathwiz_app/views/homepage/student/race_to_top_homepage_box_student.dart';
import 'package:mathwiz_app/views/homepage/student/trivia_homepage_box_student.dart';
import 'package:mathwiz_app/widgets/ham_menu_start.dart';
import 'package:provider/provider.dart';
import 'package:random_string/random_string.dart';
import '../../../constants.dart';

class HomepageStudentScreen extends StatefulWidget {
  final int index;

  HomepageStudentScreen({this.index});
  @override
  State<StatefulWidget> createState() {
    return _HomepageStudentScreenState(index: index);
  }
}

class _HomepageStudentScreenState extends State<HomepageStudentScreen> {
  int _current = 0;
  int index;
  String randomString = randomAlpha(2);

  _HomepageStudentScreenState({this.index});

  List<Widget> items = [
    HomeworkCheckHomepageBoxStudent(),
    RaceToTopHomepageBoxStudent(),
    TriviaHomepageBoxStudent(),
    AsteroidsHomepageBoxStudent(),
    AchievementHomepageBoxStudent()
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    FirestoreDatabaseService fsDatabase =
        Provider.of<FirestoreDatabaseService>(context, listen: false);
    final avatarList = fsDatabase.avatarIDList;
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("${fsDatabase.classList[index].title}",
            style: TextStyle(
              fontSize: 16,
            )),
        backgroundColor: kPrimaryColor,
      ),
      drawer: HamMenuStart(size: size),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(10.0),
                child: GridView.count(
                  mainAxisSpacing: 1,
                  crossAxisSpacing: 1,
                  crossAxisCount: 6,
                  children: List.generate(avatarList.length, (index) {
                    return Align(
                        child: Container(
                      child: Card(
                        semanticContainer: true,
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        child:
                            // Image.asset(
                            //   'assets/images/avatar.png',
                            //   fit: BoxFit.fill,
                            // ),
                            Image.network(
                          "https://www.doppelme.com/" +
                              avatarList[index].toString() +
                              "/cropb.png" +
                              '#' +
                              randomString,
                        ),
                      ),
                    ));
                  }),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 20),
              child: CarouselSlider(
                  options: CarouselOptions(
                      height: 250.0,
                      onPageChanged: (index, reason) {
                        setState(() {
                          _current = index;
                        });
                      }),
                  items: items),
            ),
            Container(
              child: Row(
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
            ),
          ],
        ),
      ),
    );
  }
}
