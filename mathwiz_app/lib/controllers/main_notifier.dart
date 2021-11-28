import 'dart:math';
import 'package:flutter/material.dart';

class MainNotifier extends ChangeNotifier {
  static const _chars =
      'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
  Random _rnd = Random();

  String _buildKey = 'random';
  String get buildKey => _buildKey;

  void getNewBuildKey() {
    _buildKey = generateNewKeyString(5);

    notifyListeners();
  }

  String generateNewKeyString(int length) =>
      String.fromCharCodes(Iterable.generate(
          length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));
}