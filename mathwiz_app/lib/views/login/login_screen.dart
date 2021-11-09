import 'package:flutter/material.dart';
import 'package:mathwiz_app/services/auth.dart';
import 'package:mathwiz_app/views/shop/shop_screen.dart';
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
  final _formKey = GlobalKey<FormState>();
  final AuthService _auth = AuthService();
  String _email;
  String _password;

  @override
  Widget build(BuildContext context) {
    Size size =
        MediaQuery.of(context).size; //provides total hieght and width of screen
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Container(
          height: size.height,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "LOGIN TO",
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
                onChanged: (value) {},
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter your email';
                  }
                  return null;
                },
                onSaved: (value) {
                  _email = value.toString();
                },
              ),
              BoxPassFeild(
                hintText: "Password",
                onChanged: (value) {},
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter your password';
                  }
                  return null;
                },
                onSaved: (value) {
                  _password = value.toString();
                },
              ),
              BoxButton(
                text: "LOGIN",
                press: () async {
                  if (_formKey.currentState.validate()) {
                    _formKey.currentState.save();
                    dynamic result = await _auth.signInEmail(_email, _password);
                    if (result == null) {
                      print("error");
                    } else {
                      Navigator.of(context).popUntil((route) => route.isFirst);
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
                    "Don't have an Account?  ",
                    style: TextStyle(color: kPrimaryColor),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Text(
                      "Sign Up",
                      style: TextStyle(
                          color: kPrimaryColor, fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
