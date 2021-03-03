import 'package:flutter/material.dart';
import 'package:mathwiz_app/constants.dart';
import 'package:mathwiz_app/views/shop/shop_screen.dart';
import 'package:mathwiz_app/widgets/box_button.dart';
import 'package:mathwiz_app/widgets/box_input_field.dart';
import 'package:mathwiz_app/widgets/ham_menu.dart';

class ClassListScreen extends StatelessWidget {
  final List<String> classList = <String>['Class A', 'Class B', 'Class C'];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context)
        .size; // provides total hieght and width of screen
    return Scaffold(
      appBar: AppBar(
        title: Text('Class List'),
        backgroundColor: kPrimaryColor,
      ),
      drawer:HamMenu(size: size),
      body: SafeArea(
          child: Column(children: <Widget>[
        Expanded(
          child: ListView.separated(
            padding: const EdgeInsets.all(8),
            itemCount: classList.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                height: size.height * 0.1,
                color: kSecondaryColor,
                child: Center(child: Text('${classList[index]}')),
              );
            },
            separatorBuilder: (BuildContext context, int index) =>
                const Divider(),
          ),
        ),
        BoxInputFeild(
          icon: Icons.assignment,
          hintText: 'Class Code',
        ),
        BoxButton(
          text: "Add Class",
          color: kPrimaryColor,
          press: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return ShopScreen();
                },
              ),
            );
          },
        ),
      ])),
    );
  }
}
