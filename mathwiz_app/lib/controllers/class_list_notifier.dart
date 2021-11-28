import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mathwiz_app/model/class_model.dart';

class ClassListNotifier {
  var classListID = ['Ppipys4C6HhPXSoWbRvs'];

  Stream<List<ClassModel>> get classList {
    return FirebaseFirestore.instance
        .collection('classrooms')
        .where('class_id', whereIn: classListID)
        .snapshots()
        .map(_classList);
  }

  List<ClassModel> _classList(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return ClassModel(
        id: doc.id,
        code: doc.data()['class_code'],
        title: doc.data()['class_title'],
        teacher: doc.data()['teacher_id'],
        stundetIDs: doc.data()['student_ids'],
      );
    }).toList();
  }

  addClass(ClassModel newClass) {
    var ref = FirebaseFirestore.instance.collection('classrooms').doc();
    ref.set({
      "class_id": ref.id,
      "class_code": newClass.code,
      "class_title": newClass.title,
      "teacher_id": newClass.teacher,
      "student_ids": newClass.stundetIDs,
    });
    classListID.add(ref.id);
  }

  // deleteClass(index) {
  //   FirebaseFirestore.instance.collection('classrooms').doc(classListID[index]).delete();
  // }
}
