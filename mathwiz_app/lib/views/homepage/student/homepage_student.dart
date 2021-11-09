import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:mathwiz_app/services/fs_database.dart';
import 'package:mathwiz_app/widgets/ham_menu.dart';
import 'package:mathwiz_app/views/homepage/teacher/homework_check_homepage_box.dart';
import 'package:mathwiz_app/views/homepage/student/race_to_top_homepage_box_student.dart';
import 'package:mathwiz_app/views/homepage/student/trivia_homepage_box_student.dart';
import 'package:provider/provider.dart';
import '../../../constants.dart';

class HomepageStudentScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomepageStudentScreenState();
  }
}

class _HomepageStudentScreenState extends State<HomepageStudentScreen> {
  int _current = 0;
  final List<Widget> items = [
    HomeworkCheckHomepageBox(),
    RaceToTopHomepageBoxStudent(),
    TriviaHomepageBoxStudent()
  ];

  @override
  void initState() {
    super.initState();
    FirestoreDatabaseService fsDatabase =
        Provider.of<FirestoreDatabaseService>(context, listen: false);

    print(fsDatabase.user);
    print(fsDatabase.classList);
  }

  @override
  Widget build(BuildContext context) {
    FirestoreDatabaseService fsDatabase =
        Provider.of<FirestoreDatabaseService>(context, listen: false);
    final avatarList = fsDatabase.avatarIDList;

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
                              "/cropb.png",
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
