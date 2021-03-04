import 'package:flutter/material.dart';
import 'package:mathwiz_app/views/login/login_screen.dart';
import 'package:mathwiz_app/widgets/box_button.dart';
import 'package:mathwiz_app/widgets/box_input_field.dart';
import 'package:mathwiz_app/widgets/box_pass_field.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:mathwiz_app/widgets/ham_menu.dart';
import 'package:mathwiz_app/widgets/homework_check_homepage_box.dart';
import 'package:mathwiz_app/widgets/race_to_top_homepage_box.dart';
import 'package:mathwiz_app/widgets/trivia_homepage_box.dart';
import '../../constants.dart';

class HomepageStudentScreen extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _HomepageStudentScreenState(
    );
  }
}

class _HomepageStudentScreenState extends State<HomepageStudentScreen> {
  int _current = 0;
final List<Widget> items = [HomeworkCheckHomepageBox(),RaceToTopHomepageBox(),TriviaHomepageBox()];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size; 
    
    return Scaffold(
      appBar: AppBar(
        title: Text("Math Class Grade 8 - Mr. Stefan",  style: TextStyle(fontSize: 16, )),
        backgroundColor: kPrimaryColor,
        ),
      drawer:HamMenu(size: size),
      body: Container(
        height: size.height,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(top: 10.0),
              height: size.height * 0.5,

              child: GridView.count(
                mainAxisSpacing: 1,
                crossAxisSpacing: 1,
                crossAxisCount: 6,
                //childAspectRatio: 6/4,
                  children: List.generate(30,(index){
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
                      )
                    );
                  }),
                ),
          ),
            CarouselSlider(
              options: CarouselOptions(
                height: 250.0,
                onPageChanged: (index, reason) {
                  setState(() {
                    _current = index;
                  });
                }
              ),
              items: items
            ),
            Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: items.map((url) {
              int index = items.indexOf(url);
              return Container(
                width: 8.0,
                height: 8.0,
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
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
    );
  }
}


