import 'dart:collection';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:mathwiz_app/model/class_model.dart';
import 'package:mathwiz_app/model/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FirestoreDatabaseService extends ChangeNotifier {
  UserModel _user;
  List<ClassModel> _classList = [];

  UserModel get user => _user;

  UnmodifiableListView<ClassModel> get classList =>
      UnmodifiableListView(_classList);

  createUser() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    FirebaseFirestore.instance
        .collection('users')
        .doc(sharedPreferences.getString('UID'))
        .set({"id": _user.uid, "class_list": []});
  }

  setUser() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    await FirebaseFirestore.instance
        .collection('users')
        .doc('iVbGPKwyzBYKkOniVNJW0C7KNNl1')
        .get()
        .then((DocumentSnapshot snapshot) {
      _user = UserModel(
        uid: snapshot.data()['id'],
        classList: snapshot.data()['class_list'],
      );
      setClassList();
    });
  }

  setClassList() {
    _user.classList.forEach((element) async {
      await FirebaseFirestore.instance
          .collection('classrooms')
          .where('class_id', isEqualTo: element)
          .get()
          .then((QuerySnapshot querySnapshot) {
        querySnapshot.docs.forEach((doc) {
          _classList.add(ClassModel(
              id: doc['class_id'],
              code: doc['class_code'],
              title: doc['class_title'],
              teacher: doc['teacher_id'],
              stundetIDs: doc['student_ids']));
        });
      });
    });
    notifyListeners();
  }

  clearClassList() {
    _classList = [];
  }

  addClass(ClassModel newClass) {
    _classList.add(newClass);
    notifyListeners();
  }

  deleteClass(index) {
    _classList
        .removeWhere((_classModel) => _classModel.id == classList[index].id);
    notifyListeners();
  }
}
