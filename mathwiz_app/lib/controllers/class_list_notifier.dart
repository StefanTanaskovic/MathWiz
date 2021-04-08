import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:mathwiz_app/model/class_model.dart';

class ClassListNotifier extends ChangeNotifier {
  List<ClassModel> _classList = [];

  UnmodifiableListView<ClassModel> get classList =>
      UnmodifiableListView(_classList);

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
