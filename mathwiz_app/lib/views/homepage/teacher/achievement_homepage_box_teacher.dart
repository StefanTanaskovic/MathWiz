import 'package:flutter/material.dart';
import 'package:mathwiz_app/controllers/achievement_notifier.dart';
import 'package:mathwiz_app/views/achievements/view_achievement.dart';
import 'package:provider/provider.dart';
import '../../../constants.dart';

class AchievementHomepageBoxTeacher extends StatefulWidget {
  @override
  _AchievementHomepageBoxTeacherState createState() => _AchievementHomepageBoxTeacherState();
}

class _AchievementHomepageBoxTeacherState extends State<AchievementHomepageBoxTeacher> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.symmetric(horizontal: 5.0),
        decoration: BoxDecoration(
            border: Border.all(
              color: kPrimaryColor,
            ),
            color: kPrimaryColor,
            borderRadius: BorderRadius.all(Radius.circular(20))),
        child: Column(
          children: <Widget>[
            SizedBox(height: 10),
            Text('Achievements',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24.0,
                    color: Colors.white)),

            Expanded(
              child: ListView.builder(
                itemCount: context.watch<AchievementNotifier>().achievementList.length,
                itemBuilder: (context, index) {
                    return Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(left: 10,right: 10),
                            child: ElevatedButton(
                              child: Text('${context.watch<AchievementNotifier>().achievementList[index].title}'),
                              style: ElevatedButton.styleFrom(
                                primary: Colors.white,
                                onPrimary: Colors.black,
                              ),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ViewAchievementScreen(
                                      achievementTitle: context.watch<AchievementNotifier>().achievementList[index].title,
                                      pointsMax: context.watch<AchievementNotifier>().achievementList[index].pointsMax,
                                      currentPoints: context.watch<AchievementNotifier>().achievementList[index].currentPoints
                                    ),
                                  ),
                                );
                              },
                          ),
                          ),
                        ),
                        Padding(
                            padding: EdgeInsets.only(right: 10),
                            child: ElevatedButton(
                              child:Icon(Icons.delete),
                              style: ElevatedButton.styleFrom(
                                primary: Colors.white,
                                onPrimary: Colors.black,
                              ),
                              onPressed: () {
                                context.read<AchievementNotifier>().deleteAchievement(index);
                              },
                            ),
                          ),
                      ]
                    );
                  }
            ),
            ),
            SizedBox(height: 10),
          ],
        )
    );
  }
}
