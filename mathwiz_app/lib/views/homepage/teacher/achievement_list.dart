import 'package:flutter/material.dart';
import 'package:mathwiz_app/controllers/achievement_notifier.dart';
import 'package:mathwiz_app/model/achievement_model.dart';
import 'package:mathwiz_app/views/achievements/view_achievement.dart';
import 'package:provider/provider.dart';

class AchievementList extends StatefulWidget {
  @override
  _AchievementListState createState() => _AchievementListState();
}

class _AchievementListState extends State<AchievementList> {
  @override
  Widget build(BuildContext context) {
    
   final achievementList = Provider.of<List<AchievementModel>>(context) ?? [];

    return Expanded(
              child: ListView.builder(
                itemCount: achievementList.length,
                itemBuilder: (context, index) {
                    return Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(left: 10,right: 10),
                            child: ElevatedButton(
                              child: Text('${achievementList[index].title}'),
                              style: ElevatedButton.styleFrom(
                                primary: Colors.white,
                                onPrimary: Colors.black,
                              ),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ViewAchievementScreen(
                                      achievementTitle: achievementList[index].title,
                                      pointsMax: achievementList[index].pointsMax,
                                      currentPoints: achievementList[index].currentPoints
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
            );
  }
}          
            
            