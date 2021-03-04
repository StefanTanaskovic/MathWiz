import 'package:flutter/material.dart';
import 'package:mathwiz_app/views/class_list/class_list_screen.dart';
import 'package:mathwiz_app/widgets/box_button.dart';
import 'package:mathwiz_app/widgets/box_input_field.dart';
import 'package:mathwiz_app/widgets/box_pass_field.dart';

import '../../constants.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoginScreenState();
  }
}

class _LoginScreenState extends State<LoginScreen> {
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
              "LOGIN TO",
              style: TextStyle(
                  fontWeight: FontWeight.bold, color: kSeonndaryColor),
            ),
            SizedBox(
              height: size.height * 0.05,
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
              onChanged: (value) {},
            ),
            BoxPassFeild(
              hintText: "Password",
              onChanged: (value) {},
            ),
            BoxButton(
              text: "LOGIN",
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return ClassListScreen();
                    },
                  ),
                );
              },
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Don't have an Account?  ",
                  style: TextStyle(color: kSeonndaryColor),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Text(
                    "Sign Up",
                    style: TextStyle(
                        color: kSeonndaryColor, fontWeight: FontWeight.bold),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
