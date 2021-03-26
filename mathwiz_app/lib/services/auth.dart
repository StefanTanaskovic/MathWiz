import 'package:firebase_auth/firebase_auth.dart';
import 'package:mathwiz_app/model/user.dart';

class AuthService {

  final FirebaseAuth _auth = FirebaseAuth.instance;


  //auth change user stream 
  Stream<UserModel> get user {
    return _auth.authStateChanges().map(_userFromFirebaseUser);
  }

  //create user obj 
  UserModel _userFromFirebaseUser(User user){
    return user != null ? UserModel(uid: user.uid) : null;


  }

  //register with email and password
  Future signUpEmail(email, password) async {
    try {
       
      UserCredential result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      User user = result.user;
      return user;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //sign in with email and password 
    Future signInEmail(email, password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      User user = result.user;
      return _userFromFirebaseUser(user);
    }on Exception catch (exception) {
      print(exception.toString());
       return null;
    } 
    catch (e) {
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