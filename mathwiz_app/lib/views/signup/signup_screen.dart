import 'package:flutter/material.dart';
import 'package:mathwiz_app/services/auth.dart';
import 'package:mathwiz_app/widgets/box_button.dart';
import 'package:mathwiz_app/widgets/box_input_field.dart';
import 'package:mathwiz_app/widgets/box_pass_field.dart';

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

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context)
        .size; // provides total hieght and width of screen
    return Scaffold(
        body: Form(
          key: _formKey,
          child: Container(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "SIGN UP WITH",
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: kSecondaryColor),
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
              onSaved: (value) {
                
              },
              hintText: "Confirm Password",
              onChanged: (value) {},
            ),
            BoxButton(
              text: "SIGN UP",
              press: () async {
                if (_formKey.currentState.validate()) {
                  _formKey.currentState.save();
                  dynamic result =  await _auth.signUpEmail(_email, _password);
                  if(result == null){
                    print("error");
                  }else{
                    print("signed in");
                    print(result);
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
