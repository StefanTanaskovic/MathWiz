import 'package:flutter/material.dart';
import 'package:mathwiz_app/widgets/box_button.dart';
import 'package:mathwiz_app/widgets/box_input_field.dart';
import 'package:mathwiz_app/widgets/box_pass_field.dart';

import '../../constants.dart';
//import 'body.dart';

class SignUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context)
        .size; // provides total hieght and width of screen
    return Scaffold(
        body: Container(
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
            onChanged: (value) {},
          ),
          BoxPassFeild(
            hintText: "Password",
            onChanged: (value) {},
          ),
          BoxPassFeild(
            hintText: "Confirm Password",
            onChanged: (value) {},
          ),
          BoxButton(
            text: "SIGN UP",
            press: () {},
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
    ));
  }
}
