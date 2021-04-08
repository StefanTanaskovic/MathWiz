import 'dart:collection';
import 'package:flutter/material.dart';
import '../model/homework_model.dart';

class HomeworkListNotifier extends ChangeNotifier {
  List<HomeworkModel> _homeworksList = [];
  Map _selected = Map();

  

  Map get selected => _selected;
  UnmodifiableListView<HomeworkModel> get homeworksList =>
      UnmodifiableListView(_homeworksList);

    changeStatus(status, index){
    _homeworksList[index].status = status;
    notifyListeners();
  }

    save(type, homework) {
    switch(type) { 
      case "Publish": {  
        homework.status = "Publish";
      _homeworksList.add(homework);
      } 
      
      break; 
    
      case "Drafts": { 
        homework.status = "Drafts";
        _homeworksList.add(homework);
      } 
      break; 
    } 
    notifyListeners();
  }

deleteHomework(index){
  _homeworksList.removeAt(index);
  notifyListeners();
}
}
