import 'package:cloud_firestore/cloud_firestore.dart';

class HomepageTeacherController {
  String classID = 'Ppipys4C6HhPXSoWbRvs';

  changeStatusRace(status, String id) {
    DocumentReference doc = FirebaseFirestore.instance
        .collection('classrooms')
        .doc(classID)
        .collection('races')
        .doc(id);
    switch (status) {
      case "Publish":
        {
          doc.set({"race_published": true}, SetOptions(merge: true));
        }
        break;

      case "Drafts":
        {
          doc.set({"race_published": false}, SetOptions(merge: true));
        }
        break;
    }
  }

  startRace(String id) {
    DocumentReference doc = FirebaseFirestore.instance
        .collection('classrooms')
        .doc(classID)
        .collection('races')
        .doc(id);
    doc.set({"race_status": 'Start Time'}, SetOptions(merge: true));
  }

  changeStatusHomework(status, String id) {
    DocumentReference doc = FirebaseFirestore.instance
        .collection('classrooms')
        .doc(classID)
        .collection('homeworks')
        .doc(id);
    switch (status) {
      case "Publish":
        {
          doc.set({"homework_published": true}, SetOptions(merge: true));
        }
        break;

      case "Drafts":
        {
          doc.set({"homework_published": false}, SetOptions(merge: true));
        }
        break;
    }
  }
}
