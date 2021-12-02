import 'dart:collection';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../model/achievement_model.dart';

class AchievementNotifier extends ChangeNotifier {
  List<AchievementModel> _achievementList = [];
  Map _selected = Map();
  String classID = 'Ppipys4C6HhPXSoWbRvs';
  String achievementID = 'D2SG3ubXXsFjTVdfLtQj';

  Map get selected => _selected;
  UnmodifiableListView<AchievementModel> get achievementList =>
      UnmodifiableListView(_achievementList);


    save(achievement) {
      _achievementList.add(achievement);
      var newAchievement = FirebaseFirestore.instance.collection('classrooms').doc(classID).collection('achievements');
      newAchievement.add({'achievement_current' : achievement.currentPoints,
                          'achievement_goal': achievement.pointsMax,
                          'achievement_title': achievement.title});
      notifyListeners();
    } 

    deleteAchievement(index){
      _achievementList.removeAt(index);
      notifyListeners();
    }

    addPointsActivity() async{
    var current = FirebaseFirestore.instance.collection('classrooms').doc(classID).collection('achievements').doc(achievementID);
    current.update({'achievement_current': FieldValue.increment(3)
    });
    notifyListeners();
    }


    addPointsHomework() async{
    var current = FirebaseFirestore.instance.collection('classrooms').doc(classID).collection('achievements').doc(achievementID);
    current.update({'achievement_current': FieldValue.increment(1)
    });
    notifyListeners();
    }
}
