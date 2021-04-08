import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';

class HomepageStudentController {

  CollectionReference triviaListCollection = FirebaseFirestore.instance.collection('classrooms')
    .doc('EUYxFs74abDmqMHLSKcv').collection('trivias');
  
  //get triva quizzes 
  Stream<QuerySnapshot> get triviaList{
    return triviaListCollection.snapshots();
  }


}
