import 'package:flutter/material.dart';
import 'package:mathwiz_app/controllers/avatar_notifier.dart';
import 'package:mathwiz_app/services/auth.dart';
import 'package:mathwiz_app/services/avatar_api.dart';
import 'package:mathwiz_app/services/fs_database.dart';
import 'package:mathwiz_app/views/signup/create_avatar_screen.dart';
import 'package:mathwiz_app/widgets/box_button.dart';
import 'package:mathwiz_app/widgets/box_input_field.dart';
import 'package:mathwiz_app/widgets/box_pass_field.dart';
import 'package:provider/provider.dart';

import '../../constants.dart';
//import 'body.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();

  final AuthService _auth = AuthService();

  String _email;
  String _password;
  String _chosenValue;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: Form(
      key: _formKey,
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "SIGN UP WITH",
              style: TextStyle(
                  fontWeight: FontWeight.bold, color: kSecondaryColor),
            ),
            Image.asset(
              "assets/images/math_logo.png",
              height: size.height * 0.25,
            ),
            SizedBox(
              height: size.height * 0.05,
            ),
            BoxInputFeild(
              hintText: "Email",
              icon: Icons.email,
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter your email';
                }
                return null;
              },
              onSaved: (value) {
                _email = value.toString();
              },
              onChanged: (value) {},
            ),
            BoxPassFeild(
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter your password';
                }
                return null;
              },
              onSaved: (value) {
                _password = value.toString();
              },
              hintText: "Password",
              onChanged: (value) {},
            ),
            BoxPassFeild(
              validator: (value) {
                if ((value.isEmpty)) {
                  return 'Please make sure your password matches';
                }
                return null;
              },
              onSaved: (value) {},
              hintText: "Confirm Password",
              onChanged: (value) {},
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.account_circle,
                  color: kSecondaryColor,
                  size: 24.0,
                ),
                SizedBox(width: 15),
                DropdownButton<String>(
                  focusColor: Colors.white,
                  value: _chosenValue,
                  style: TextStyle(color: Colors.white),
                  iconEnabledColor: Colors.black,
                  items: <String>[
                    'Teacher',
                    'Student',
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: TextStyle(color: Colors.black),
                      ),
                    );
                  }).toList(),
                  hint: Text(
                    "Please choose account type",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 17,
                    ),
                  ),
                  onChanged: (String value) {
                    setState(() {
                      _chosenValue = value;
                    });
                  },
                ),
              ],
            ),
            BoxButton(
              text: "SIGN UP",
              press: () async {
                if (_formKey.currentState.validate()) {
                  _formKey.currentState.save();
                  dynamic result =
                      await _auth.signUpEmail(_email, _password, _chosenValue);
                  if (result == null) {
                    print("error");
                  } else {
                    FirestoreDatabaseService fsNotifier =
                        Provider.of<FirestoreDatabaseService>(context,
                            listen: false);
                    AvatarNotifier avatarNotifier =
                        Provider.of<AvatarNotifier>(context, listen: false);
                    APIService apiService = new APIService();
                    apiService.createAvatar().then((value) {
                      if (value != null) {
                        print("Avatar Created: " + value.avatarID);
                        avatarNotifier.setAvatarUrl(value.avatarID);
                        fsNotifier.setAvatarID(value.avatarID);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CreateAvatarScreen(),
                            ));
                      } else {
                        print('Error!');
                      }
                    });
                  }
                }
              },
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Already have an Account?  ",
                  style: TextStyle(color: kPrimaryColor),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Text(
                    "Login",
                    style: TextStyle(
                        color: kPrimaryColor, fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
            //OrDivider(),
          ],
        ),
      ),
    ));
  }
}
