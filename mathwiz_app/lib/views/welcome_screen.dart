import 'package:flutter/material.dart';
import 'package:mathwiz_app/model/avatar/tops_model.dart';
import 'package:mathwiz_app/services/avatar_api.dart';
import 'package:mathwiz_app/widgets/box_button.dart';
import '../constants.dart';
import 'login/login_screen.dart';
import 'signup/signup_screen.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
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
            Image.asset(
              "assets/images/math_logo.png",
              height: 200,
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
                      return LoginScreen();
                    },
                  ),
                );
              },
            ),
            BoxButton(
              text: "SIGN UP",
              color: kSecondaryLightColor,
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

  void fetchMethod() async {
    print('Tapped');
    APIService apiService = new APIService();

    apiService.fetchAssets().then((value) {
      if (value != null) {
        var test = topsModelFromJson(value);
        print(test.tops[1]);

        // setState(() {
        //   image = test.tops[1].thumbSrc;
        // });
      } else {
        print('Error!');
      }
    });
  }
}
