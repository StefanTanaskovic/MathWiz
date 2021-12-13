import 'dart:collection';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../model/homework_model.dart';

class HomeworkListNotifier extends ChangeNotifier {
  List<String> _homeworksList = [];
  Map _selected = Map();
  String classID = 'Ppipys4C6HhPXSoWbRvs';


  Map get selected => _selected;
  UnmodifiableListView<String> get homeworksList =>
      UnmodifiableListView(_homeworksList);


    save(type, homework) async {
      DocumentReference newHomework = await FirebaseFirestore.instance.collection('classrooms').doc(classID).collection('homeworks').add({'homework_description':homework.description,
                          'homework_gold':homework.gold,
                          'homework_published': true,
                          'homework_text':homework.ocrtext,
                          'homework_title':homework.title});
    switch(type) { 
      case "Drafts": { 
        newHomework.update({'homework_published':false});
        _homeworksList.add(newHomework.id);
        break;
      }
      case "Published": { 
      newHomework.update({'homework_published':true});
      _homeworksList.add(newHomework.id);
      } 
      break; 
    } 
    notifyListeners();
  }

deleteHomework(id){
      print(id);
      var newHomework =  FirebaseFirestore.instance.collection('classrooms').doc(classID).collection('homeworks').doc(id);
      newHomework.delete();
      _homeworksList.remove(id);
      notifyListeners();
}


}
