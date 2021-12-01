import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:mathwiz_app/model/class_model.dart';
import 'package:mathwiz_app/model/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FirestoreDatabaseService extends ChangeNotifier {
  UserModel _userM;
  List<ClassModel> _classList = [];
  String _classID;
  List<String> _avatarIDsInClass = [];

  UserModel get user => _userM;
  List<ClassModel> get classList => _classList;
  String get classID => _classID;
  List<String> get avatarIDList => _avatarIDsInClass;

  updateBank(int amount) {
    CollectionReference ref = FirebaseFirestore.instance.collection('users');
    var currentAmount = _userM.bank;
    currentAmount = currentAmount + (amount);
    ref
        .doc(_userM.uid)
        .update({'bank': currentAmount})
        .then((value) => print("Money Updated"))
        .catchError((error) => print("Failed to update user: $error"));

    // Update User
    _userM.bank = currentAmount;
  }

  Future getClassAvatars(int index) async {
    _avatarIDsInClass = [];
    await FirebaseFirestore.instance
        .collection('users')
        .get()
        .then((QuerySnapshot collection) {
      collection.docs.forEach((doc) {
        if (_classList[index].stundetIDs.contains(doc['id'])) {
          print(_classList[index].stundetIDs);
          _avatarIDsInClass.add(doc['avatar_id']);
        }
      });
    });
    notifyListeners();
  }

  createUser(String type) async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    FirebaseFirestore.instance
        .collection('users')
        .doc(sharedPreferences.getString('UID'))
        .set({
      "id": sharedPreferences.getString('UID'),
      "class_list": [],
      "avatar_id": "",
      "bank": 100,
      "type": type
    });
  }

  setUser() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    await FirebaseFirestore.instance
        .collection('users')
        .doc(sharedPreferences.getString('UID'))
        .get()
        .then((DocumentSnapshot snapshot) {
      UserModel _userModel = new UserModel(
          uid: snapshot.data()['id'],
          classList: snapshot.data()['class_list'],
          avatarID: snapshot.data()['avatar_id'],
          bank: snapshot.data()['bank'],
          type: snapshot.data()['type']);

      _userM = _userModel;

      setClassList();
      notifyListeners();
    });
  }

  setClassList() async {
    if (_classList.isNotEmpty) {
      print("ClassList not null");
    } else {
      await FirebaseFirestore.instance
          .collection('classrooms')
          .get()
          .then((QuerySnapshot collection) {
        _userM.classList.forEach((classID) {
          collection.docs.forEach((doc) {
            if (doc['class_id'] == classID) {
              _classList.add(ClassModel(
                  id: doc['class_id'],
                  code: doc['class_code'],
                  title: doc['class_title'],
                  teacher: doc['teacher_id'],
                  stundetIDs: doc['student_ids']));
            }
          });
        });
      });

      notifyListeners();
    }
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

    _classList.add(newClass);

    var userRef = FirebaseFirestore.instance
        .collection('users')
        .doc(_userM.uid.toString());

    userRef.update({
      'class_list': FieldValue.arrayUnion([ref.id])
    });

    notifyListeners();
  }

  addClassCode(String code) async {
    await FirebaseFirestore.instance
        .collection('classrooms')
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        if (doc["class_code"] == code) {
          var classRef = FirebaseFirestore.instance
              .collection('classrooms')
              .doc(doc["class_id"]);
          classRef.update({
            'student_ids': FieldValue.arrayUnion([_userM.uid.toString()])
          });
          _classList.add(ClassModel(
              id: doc['class_id'],
              code: doc['class_code'],
              title: doc['class_title'],
              teacher: doc['teacher_id'],
              stundetIDs: doc['student_ids'] + [_userM.uid.toString()]));

          var userRef = FirebaseFirestore.instance
              .collection('users')
              .doc(_userM.uid.toString());
          userRef.update({
            'class_list': FieldValue.arrayUnion([doc["class_id"]])
          });
        }
      });
    });
    notifyListeners();
  }

  setAvatarID(value) {
    FirebaseFirestore.instance
        .collection('users')
        .doc(_userM.uid.toString())
        .update({'avatar_id': value});
    _userM.avatarID = value;
  }

  deleteClass(index) {
    _classList
        .removeWhere((_classModel) => _classModel.id == classList[index].id);
    notifyListeners();
  }

  clearClassList() {
    _classList = [];
  }

  setClassID(int index) {
    _classID = classList[index].id;
  }
}
