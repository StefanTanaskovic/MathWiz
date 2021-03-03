import 'package:flutter/material.dart';
import 'package:mathwiz_app/widgets/box_button.dart';

import '../constants.dart';
import 'homepage/homepage_student.dart';
import 'login/login_screen.dart';
import 'signup/signup_screen.dart';
import 'trivia/race_to_top.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context)
        .size; // provides total hieght and width of screen
    return Scaffold(
      body: Container(
        height: size.height,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "WELCOME TO",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: size.height * 0.05,
            ),
            Image.asset(
              "assets/images/math_logo.png",
              height: size.height * 0.25,
            ),
            SizedBox(
              height: size.height * 0.15,
            ),
            BoxButton(
              text: "LOGIN",
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return HomepageStudentScreen();
                    },
                  ),
                );
              },
            ),
            BoxButton(
              text: "SIGN UP",
              color: kSecondaryColor,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return SignUpScreen();
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
