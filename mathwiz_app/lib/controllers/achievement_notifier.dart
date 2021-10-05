import 'dart:collection';
import 'package:flutter/material.dart';
import '../model/achievement_model.dart';

class AchievementNotifier extends ChangeNotifier {
  List<AchievementModel> _achievementList = [];
  Map _selected = Map();

  Map get selected => _selected;
  UnmodifiableListView<AchievementModel> get achievementList =>
      UnmodifiableListView(_achievementList);


    save(achievement) {
      _achievementList.add(achievement);
      notifyListeners();
    } 

    deleteAchievement(index){
      _achievementList.removeAt(index);
      notifyListeners();
    }

    addPoints(index){
      _achievementList[index].currentPoints += 1;
    }
}
