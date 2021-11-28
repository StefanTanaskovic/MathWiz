import 'package:mathwiz_app/model/class_model.dart';

class UserModel {
  String uid;
  int bank;
  List classList;
  String avatarID;
  String type;

  UserModel({
    this.uid, 
    this.classList, 
    this.avatarID,
    this.bank,
    this.type
    });
}
