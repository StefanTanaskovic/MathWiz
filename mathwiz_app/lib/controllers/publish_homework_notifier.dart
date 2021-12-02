import 'dart:collection';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../model/homework_model.dart';

class HomeworkListNotifier extends ChangeNotifier {
  List<HomeworkModel> _homeworksList = [];
  Map _selected = Map();
  String classID = 'Ppipys4C6HhPXSoWbRvs';


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
      var newHomework = FirebaseFirestore.instance.collection('classrooms').doc(classID).collection('homeworks');
      newHomework.add({'homework_description':homework.description,
                          'homework_gold':homework.gold,
                          'homework_published': true,
                          'homework_text':homework.ocrtext,
                          'homework_title':homework.title});
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
