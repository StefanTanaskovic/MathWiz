import 'dart:collection';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AchievementNotifier extends ChangeNotifier {
  List<DocumentReference> _achievementList = [];
  Map _selected = Map();
  String classID = 'Ppipys4C6HhPXSoWbRvs';
  String achievementID = 'D2SG3ubXXsFjTVdfLtQj';

  Map get selected => _selected;
  UnmodifiableListView<DocumentReference> get achievementList =>
      UnmodifiableListView(_achievementList);


    save(achievement) async {
      DocumentReference newAchievement = await FirebaseFirestore.instance.collection('classrooms').doc(classID).collection('achievements')
                    .add({'achievement_current' : achievement.currentPoints,
                          'achievement_goal': achievement.pointsMax,
                          'achievement_title': achievement.title});
      _achievementList.add(newAchievement);
      notifyListeners();
    } 

    deleteAchievement(id){
      var newHomework =  FirebaseFirestore.instance.collection('classrooms').doc(classID).collection('achievements').doc(id);
      newHomework.delete();
      _achievementList.remove(id);
      notifyListeners();
    }

    addPointsActivity() async{
    for (var index in _achievementList){
    index.update({'achievement_current': FieldValue.increment(3)
    });
    notifyListeners();
    }
    }


    addPointsHomework() async{
    for (var index in _achievementList){
    index.update({'achievement_current': FieldValue.increment(3)
    });
    notifyListeners();
    }
    }
}
