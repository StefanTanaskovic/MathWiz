import 'package:cloud_firestore/cloud_firestore.dart';

class HomepageTeacherController {

  String classID = 'Ppipys4C6HhPXSoWbRvs';
   
  changeStatusRace(status, String id){
     DocumentReference doc = FirebaseFirestore.instance.collection('classrooms')
    .doc(classID).collection('races').doc(id);
    switch(status) { 
      case "Publish": {  
        doc.set({
          "race_published" : true
        }, SetOptions(merge: true));
      } 
      break; 
    
      case "Drafts": { 
        doc.set({
          "race_published" : false
        }, SetOptions(merge: true));
      } 
      break; 
    } 
  }
}
