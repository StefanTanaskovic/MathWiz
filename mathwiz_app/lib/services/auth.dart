import 'package:firebase_auth/firebase_auth.dart';
import 'package:mathwiz_app/model/user.dart';
import 'package:mathwiz_app/services/fs_database.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //auth change user stream
  Stream<UserModel> get user {
    return _auth.authStateChanges().map(_userFromFirebaseUser);
  }

  //create user obj
  UserModel _userFromFirebaseUser(User user) {
    return user != null ? UserModel(uid: user.uid) : null;
  }

  //register with email and password
  Future signUpEmail(email, password, type) async {
    try {
      final SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();

      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User user = result.user;
      sharedPreferences.setString('UID', user.uid);

      FirestoreDatabaseService databaseService = new FirestoreDatabaseService();
      databaseService.createUser(type);

      return user;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //sign in with email and password
  Future signInEmail(email, password) async {
    try {
      final SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();

      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User user = result.user;
      sharedPreferences.setString('UID', user.uid);

      return _userFromFirebaseUser(user);
    } on Exception catch (exception) {
      print(exception.toString());
      return null;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
